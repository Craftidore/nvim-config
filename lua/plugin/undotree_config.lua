local UndoTree = {
  'jiaoshijie/undotree',
  dependencies = 'nvim-lua/plenary.nvim',
  opts = {
    float_diff = true, -- using float window previews diff, set this `true` will disable layout option
    layout = 'left_bottom', -- "left_bottom", "left_left_bottom"
    position = 'left', -- "right", "bottom"
    ignore_filetype = {
      'ministarter',
      'undotree',
      'undotreeDiff',
      'qf',
      'TelescopePrompt',
      'spectre_panel',
      'tsplayground',
    },
    window = {
      winblend = vim.g.winblend,
    },
    keymaps = {
      ['j'] = 'move_next',
      ['k'] = 'move_prev',
      ['gj'] = 'move2parent',
      ['J'] = 'move_change_next',
      ['K'] = 'move_change_prev',
      ['<cr>'] = 'action_enter',
      ['p'] = 'enter_diffbuf',
      ['q'] = 'quit',
    },
  },
  keys = { -- load the plugin only when using it's keybinding:
    { '<leader>ou', "<cmd>lua require('undotree').toggle()<cr>", mode = 'n', desc = '[O]pen [U]ndotree' },
  },
}

return UndoTree
