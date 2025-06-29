local o = vim.o
local opt = vim.opt
local utils = vim.g.utils

-- Guess Indent handles this, but for empty files...
local tab_options = { 'tabstop', 'softtabstop', 'shiftwidth' }
local tab_width = 4
for i = 1, #tab_options do
  opt[tab_options[i]] = tab_width
end
opt.expandtab = not utils.is_machmotion()
