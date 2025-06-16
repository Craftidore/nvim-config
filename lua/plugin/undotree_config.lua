local UndoTree = {
  'jiaoshijie/undotree',
  dependencies = 'nvim-lua/plenary.nvim',
  config = true,
  keys = { -- load the plugin only when using it's keybinding:
    { '<leader>gz', "<cmd>lua require('undotree').toggle()<cr>" },
  },
}

return UndoTree
