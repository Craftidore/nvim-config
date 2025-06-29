local utils = vim.g.utils
local Keymaps = utils.keymaps

Keymaps.noremap('n', '<leader>bn', [[<cmd>bnext<CR>]], 'Next buffer')
Keymaps.noremap('n', '<leader>bN', [[<cmd>bprev<CR>]], 'Previous buffer')
Keymaps.noremap('n', '<leader>bb', [[<cmd>buffers<cr>:b<space>]], 'Open buffer picker')
Keymaps.noremap('n', '<leader>bq', [[<cmd>bd<cr>]], 'Close buffer')
Keymaps.noremap('n', '<leader>bd', [[<cmd>bd<cr>]], 'Close buffer')
-- From https://stackoverflow.com/a/42071865
-- `|`   - chains commands
-- `%bd` - deletes all buffers
-- `e#`  - opens last buffer for editing
-- `bd#` - closes last buffer since vim auto-creates a nameless buffer after `%bd`
-- `'"`  - reset cursor position after all of this
Keymaps.noremap('n', '<leader>bo', [[<cmd>%bd|e#|bd#<cr>|`"]], 'Close all buffers except current')

utils.defer.add_deferred(function()
  utils.keymaps.wk_add({
    { '<leader>b', group = '[B]uffer' },
  })
end, 'which-key')
