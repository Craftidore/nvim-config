local utils = vim.g.utils
local GitsignsConfig = {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  enabled = not utils.is_machmotion(),
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
}

return GitsignsConfig
