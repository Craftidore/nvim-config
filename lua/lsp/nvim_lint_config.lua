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
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        local lint = require('lint')
        lint.try_lint()
        lint.try_lint('typos')
        lint.try_lint('editorconfig-checker')
      end,
    })
  end,
}

return NvimLint
