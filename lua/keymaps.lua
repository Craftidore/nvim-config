local utils = require('utils')
local Keymaps = utils.keymaps

-- NOTE: Primary Behavior (No-namespace)

Keymaps.noremap('n', 'ZF', [[<CMD>w<CR>]], 'Save current buffer (like ZZ)')

Keymaps.noremap('i', 'jj', '<Esc>', 'Switch to normal mode')
Keymaps.noremap('i', 'jk', '<Esc>', 'Switch to normal mode')

Keymaps.noremap(
  'c',
  '<C-f>',
  '<C-f><C-w>' .. tostring(vim.g.cmdline_auto_height ~= nil and vim.g.cmdline_auto_height or 3) .. '_a',
  'Open cmdline-window'
)

-- Not mapped to anything in visual mode
Keymaps.noremap({ 'v' }, '<C-k>', function()
  local start_mark = utils.marks.get_mark_row_col('<')
  local end_mark = utils.marks.get_mark_row_col('>')
  local diff = end_mark[1] - start_mark[1]
  local keys = [[<Esc><CMD>'<,'>m '>-]] .. tostring(diff + 2) .. [[<CR>gv=gv]]
  local keys_escaped = vim.api.nvim_replace_termcodes(keys, true, false, true)
  vim.api.nvim_feedkeys(keys_escaped, 'v', false)
end, 'Move selected lines up')
Keymaps.noremap({ 'v' }, '<C-j>', function()
  local start_mark = utils.marks.get_mark_row_col('<')
  local end_mark = utils.marks.get_mark_row_col('>')
  local diff = end_mark[1] - start_mark[1]
  local keys = [[<Esc><CMD>'<,'>m '<+]] .. tostring(diff + 1) .. [[<CR>gv=gv]]
  local keys_escaped = vim.api.nvim_replace_termcodes(keys, true, false, true)
  vim.api.nvim_feedkeys(keys_escaped, 'v', false)
end, 'Move selected lines down')

-- - `s`/`S`: Leap.nvim
-- - `X`: Kill last character
-- - `x`: ~~Available for use~~ ok, I do actually use this

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
Keymaps.noremap('n', '<leader>oz', '<CMD>WhichKey<CR>z=', '[O]pen Spell Suggest Picker ([z]= alias)')
Keymaps.noremap(
  'n',
  '<leader>oc',
  '<CMD>copen<CR><C-w>' .. tostring(vim.g.quickfix_auto_height ~= nil and vim.g.quickfix_auto_height or 3) .. '_',
  '[O]pen Qui[c]kfix (:copen alias)'
)
