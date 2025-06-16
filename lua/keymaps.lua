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

Keymaps.noremap('n', 'ZF', [[<CMD>w<CR>]])

Keymaps.noremap('i', 'jj', '<Esc>', 'Switch to normal mode')
Keymaps.noremap('i', 'jk', '<Esc>', 'Switch to normal mode')

Keymaps.noremap('n', '<leader>n', [[<cmd>bnext<CR>]], 'Next buffer')
Keymaps.noremap('n', '<leader>N', [[<cmd>bprev<CR>]], 'Previous buffer')
Keymaps.noremap(
  'n',
  '<leader>bb',
  [[<cmd>buffers<cr>:b<space>]],
  'Open buffer picker'
)
Keymaps.noremap('n', '<leader>bd', [[<cmd>bq<cr>]], 'Close buffer')

local trailingKeys =
  { ',', ';', ':', '"', "'", '(', ')', '[', ']', '{', '}', '\\', '.' }
for i = 1, #trailingKeys do
  local key = trailingKeys[i]
  Keymaps.noremap(
    'n',
    '<leader>' .. key,
    'mzA' .. key .. '<Esc>`z',
    'Add ' .. key .. ' to end of current line'
  )
end
Keymaps.noremap('n', 'X', 'mz$"_x`z') -- Remove last character from line

-- Better copy && paste
local copyPasteModes = { 'n', 'x' }
local copyPasteKeys = { 'y', 'Y', 'p', 'P', 'd', 'D', 'c', 'C' }
for _, m in ipairs(copyPasteModes) do
  for _, k in ipairs(copyPasteKeys) do
    Keymaps.noremap(
      m,
      '<leader>' .. k,
      '"+' .. k,
      'Perform ' .. k .. ' to system clipboard'
    )
  end
end

Keymaps.silent(
  'n',
  '<leader>gu',
  'mz?[a-z]<cr><cmd>nohl<cr>gul`z',
  'Lowercase latest uppercase letter'
)

-- Better copy-all
Keymaps.silent('n', '<leader>a', 'mzggVG"+y`z', 'Copy entire buffer')

-- Better z=
Keymaps.noremap(
  'n',
  '<leader>zz',
  '<cmd>WhichKey<cr>z=',
  'Open Spell Suggest Picker (z= alias)'
)

-- Tmux "Zoom"-y equivalent
Keymaps.noremap(
  'n',
  '<C-w>t',
  '<cmd>tab split<CR>',
  'Zoom in on current buffer'
)
-- alias, for muscle memory
Keymaps.noremap(
  'n',
  '<C-w>z',
  '<cmd>tab split<CR>',
  'Zoom in on current buffer'
)
