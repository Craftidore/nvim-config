Keymaps = {}
local keymap = vim.keymap.set
function Keymaps.noremap(mode, lhs, rhs, desc)
  if desc == nil then
    desc = 'No description provided'
  end
  keymap(mode, lhs, rhs, { noremap = true, desc = desc })
end
function Keymaps.silent(mode, lhs, rhs)
  keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

Keymaps.noremap('i', 'jj', '<Esc>')
Keymaps.noremap('i', 'jk', '<Esc>')

Keymaps.noremap('n', '<leader>n', [[<cmd>bnext<CR>]])
Keymaps.noremap('n', '<leader>N', [[<cmd>bprev<CR>]])
Keymaps.noremap('n', '<leader>bb', [[<cmd>buffers<cr>:b<space>]])
Keymaps.noremap('n', '<leader>bd', [[<cmd>bd<cr>]])

local trailingKeys = { ',', ';', ':', '"', "'", '(', ')', '[', ']', '{', '}', '\\', '.' }
for i = 1, #trailingKeys do
  Keymaps.noremap('n', '<leader>' .. trailingKeys[i], 'mzA' .. trailingKeys[i] .. '<Esc>`z')
end
Keymaps.noremap('n', 'X', 'mz$"_x`z') -- Remove last character from line

-- Better copy && paste
local copyPasteModes = { 'n', 'x' }
local copyPasteKeys = { 'y', 'Y', 'p', 'P', 'd', 'D', 'c', 'C' }
for _, m in ipairs(copyPasteModes) do
  for _, k in ipairs(copyPasteKeys) do
    Keymaps.noremap(m, '<leader>' .. k, '"+' .. k)
  end
end

Keymaps.silent('n', '<leader>gu', 'mz?[a-z]<cr><cmd>nohl<cr>gul`z')

-- Better copy-all
Keymaps.silent('n', '<leader>a', 'mzggVG"+y`z')
