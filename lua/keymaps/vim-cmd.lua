local utils = vim.g.utils
local Keymaps = utils.keymaps

Keymaps.noremap(
  'c',
  '<C-f>',
  '<C-f><C-w>' .. tostring(vim.g.cmdline_auto_height ~= nil and vim.g.cmdline_auto_height or 3) .. '_a',
  'Open cmdline-window'
)
