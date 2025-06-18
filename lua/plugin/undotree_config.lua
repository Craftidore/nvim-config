local UndoTree = {
  'jiaoshijie/undotree',
  dependencies = 'nvim-lua/plenary.nvim',
  opts = {},
  keys = { -- load the plugin only when using it's keybinding:
    { '<leader>ou', "<cmd>lua require('undotree').toggle()<cr>", mode = 'n', desc = '[O]pen [U]ndotree' },
  },
}

return UndoTree
