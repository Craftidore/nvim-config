local utils = vim.g.utils
local noremap = utils.keymaps.noremap
local LeapConfig = {
  'ggandor/leap.nvim',
  dependencies = {
    { 'tpope/vim-repeat' },
  },
  config = function()
    local leap = require('leap')
    leap.opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }
    leap.opts.safe_labels = {}
    noremap({ 'n', 'x', 'o' }, 's', '<Plug>(leap)', 'Leap in current buffer')
    noremap('n', 'S', '<Plug>(leap-anywhere)', 'Leap in any open window')
    -- Or just set to grey directly, e.g. { fg = '#777777' },
    -- if Comment is saturated.
    vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
  end,
}
return LeapConfig
