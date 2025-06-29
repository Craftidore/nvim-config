local SonokaiConfig = {
  'sainnhe/sonokai',
  -- lazy = false,
  priority = 1000,
  init = function()
    vim.g.sonokai_style = 'espresso'
    vim.g.sonokai_enable_italic = true
  end,
}

return SonokaiConfig
