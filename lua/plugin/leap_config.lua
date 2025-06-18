local LeapConfig = {
  'ggandor/leap.nvim',
  dependencies = {
    { 'tpope/vim-repeat' },
  },
  config = function()
    local leap = require('leap')
    leap.opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }
    leap.opts.safe_labels = {}
    vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
    vim.keymap.set('n', 'S', '<Plug>(leap-anywhere)')
    -- Or just set to grey directly, e.g. { fg = '#777777' },
    -- if Comment is saturated.
    vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
  end,
}
return LeapConfig
