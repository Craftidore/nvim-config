local SonokaiConfig = {
  'sainnhe/sonokai',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    -- Temporary disable-background-modifications to keep primary and new neovim configs distinct
    -- -- vim.cmd([[autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE]])
    vim.g.sonokai_style = 'espresso'
    vim.g.sonokai_enable_italic = true
    vim.cmd.colorscheme('sonokai')
  end,
}

return SonokaiConfig
