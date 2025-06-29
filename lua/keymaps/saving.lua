local utils = vim.g.utils
local Keymaps = utils.keymaps

Keymaps.noremap('n', 'ZF', [[<CMD>w<CR>]], 'Save current buffer (like ZZ)')
Keymaps.noremap('n', 'ZQ', [[<CMD>qall<CR>]], 'Close all buffers (like ZZ)')
