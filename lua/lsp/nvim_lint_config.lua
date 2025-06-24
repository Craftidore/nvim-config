local function lint_ignore(ft)
  local ignored_filetypes = {
    'help',
    'ministarter',
    'TelescopePrompt',
    'mason',
    'lazy',
  }
  local contains = vim.g.utils.lua.contains
  local bad_ft = contains(ignored_filetypes, ft)
  return bad_ft
end

local NvimLint = {
  'mfussenegger/nvim-lint',
  cond = false,
  lazy = false,
  config = function()
    local lint = require('lint')
    lint.linters_by_ft = {
      cpp = { 'cpplint' },
    }
    -- TODO: Add looping utils.ifilter to not try and call missing linters
  end,
  init = function()
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost' }, {
      callback = function(ev)
        local filetype = vim.api.nvim_get_option_value('filetype', { buf = ev.buf })
        if lint_ignore(filetype) then
          return
        end

        -- NOTE: xpcall didn't work to catch lint errors because of async...
        local lint = require('lint')
        -- Let this fail silently, since linters may not be installed yet
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        lint.try_lint()
        -- TODO: Don't try and call missing linters
        lint.try_lint('typos')
        if vim.b.editorconfig ~= nil then
          lint.try_lint('editorconfig-checker')
        end
      end,
    })
  end,
}

return NvimLint
