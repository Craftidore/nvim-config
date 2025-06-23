local NvimLint = {
  'mfussenegger/nvim-lint',
  lazy = false,
  config = function()
    local lint = require('lint')
    lint.linters_by_ft = {
      cpp = { 'cpplint' },
    }
  end,
  init = function()
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost' }, {
      callback = function()
        local lint = require('lint')
        -- Let this fail silently, since linters may not be installed yet
        xpcall(function()
          -- try_lint without arguments runs the linters defined in `linters_by_ft`
          -- for the current filetype
          lint.try_lint()
          lint.try_lint('typos')
          if vim.b.editorconfig ~= nil then
            lint.try_lint('editorconfig-checker')
          end
        end, function()
          vim.cmd([[echom 'A linter failed to run']])
        end)
      end,
    })
  end,
}

return NvimLint
