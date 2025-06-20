local utils = require('utils')
local Keymaps = utils.keymaps

-- NOTE: Primary Behavior (No-namespace)

Keymaps.noremap('n', 'ZF', [[<CMD>w<CR>]], 'Save current buffer (like ZZ)')

Keymaps.noremap('i', 'jj', '<Esc>', 'Switch to normal mode')
Keymaps.noremap('i', 'jk', '<Esc>', 'Switch to normal mode')

Keymaps.noremap({ 'n', 'v' }, '/', 'q/a', 'Search forwards with buffer editing')
Keymaps.noremap({ 'n', 'v' }, 'q/', '/', 'Search forwards (normal)')
Keymaps.noremap({ 'n', 'v' }, '?', 'q?a', 'Search backwards with buffer editing')
Keymaps.noremap({ 'n', 'v' }, 'q?', '?', 'Search backwards (normal)')
Keymaps.noremap({ 'n', 'v' }, ':', 'q:a', 'Vim CMD with buffer editing')
Keymaps.noremap({ 'n', 'v' }, 'q:', ':', 'Vim CMD (normal)')

-- - `s`/`S`: Leap.nvim
-- - `X`: Kill last character
-- - `x`: Available for use

-- Remove last character from line
Keymaps.noremap('n', 'X', 'mz$"_x`z', 'Kill [X] the last character on the line')

-- NOTE: Namespaces

Keymaps.noremap('n', '<leader>s', '<NOP>', 'Namespace No-Op')
Keymaps.noremap('n', '<leader>b', '<NOP>', 'Namespace No-Op')
Keymaps.noremap('n', '<leader>t', '<NOP>', 'Namespace No-Op')
Keymaps.noremap('n', '<leader>l', '<NOP>', 'Namespace No-Op')
Keymaps.noremap('n', '<leader>h', '<NOP>', 'Namespace No-Op')
Keymaps.noremap('n', '<leader>o', '<NOP>', 'Namespace No-Op')
Keymaps.noremap('n', '<leader>u', '<NOP>', 'Namespace No-Op')
Keymaps.noremap('n', '<leader>lt', '<NOP>', 'Namespace No-Op')

-- NOTE: Buffer Commands (namespace: <leader>b)

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

-- NOTE: Trailing Punctuation
--       (no namespace; <leader>{punctuation})

local trailingKeys = { ',', ';', ':', '"', "'", '(', ')', '[', ']', '{', '}', '\\', '/', '.' }
for i = 1, #trailingKeys do
  local key = trailingKeys[i]
  Keymaps.noremap('n', '<leader>' .. key, 'mzA' .. key .. '<Esc>`z', 'Add ' .. key .. ' to end of current line')
  utils.which_key(function(whichkey)
    whichkey.add({
      { '<leader>' .. key, hidden = true },
    })
  end)
end

-- NOTE: System Copy/Paste (<leader>y/c/d/p)

-- Better copy && paste
local copyPasteModes = { 'n', 'x' }
local copyPasteKeys = { 'y', 'Y', 'p', 'P', 'd', 'D', 'c', 'C' }
for _, m in ipairs(copyPasteModes) do
  for _, k in ipairs(copyPasteKeys) do
    Keymaps.noremap(m, '<leader>' .. k, '"+' .. k, 'Perform ' .. k .. ' to system clipboard')
    utils.which_key(function(whichkey)
      whichkey.add({
        { '<leader>' .. k, hidden = true },
      })
    end)
  end
end

-- NOTE: Utility:

Keymaps.noremap('n', '<leader>uu', '<NOP>', '[U]til: Cancel util run without undo')
Keymaps.noremap('n', '<leader>uh', '<CMD>nohl<CR>', '[U]til: Turn search [h]ighlighting off')
Keymaps.noremap('n', '<leader>ucl', 'mz?[a-z]<cr><cmd>nohl<cr>gul`z', '[U]til: Lowercase latest upper[c]ase [l]etter')

-- Better copy-all
Keymaps.noremap('n', '<leader>ua', 'mzggVG"+y`z', '[U]til: Copy [a]ll of the buffer to clipboard')

-- NOTE: Window

-- Tmux "Zoom"-y equivalent
Keymaps.noremap('n', '<C-w>t', '<cmd>tab split<CR>', '[W]indow: Zoom in on current buffer (opens [t]ab)')
-- alias, for muscle memory
Keymaps.noremap('n', '<C-w>z', '<cmd>tab split<CR>', '[W]indow: [z]oom in on current buffer (opens tab)')

-- NOTE: Open

-- Better z=
Keymaps.noremap('n', '<leader>oz', '<cmd>WhichKey<cr>z=', '[O]pen Spell Suggest Picker ([z]= alias)')
