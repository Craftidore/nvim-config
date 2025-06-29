local utils = vim.g.utils
local Keymaps = utils.keymaps

-- Not mapped to anything in visual mode
Keymaps.noremap({ 'v' }, '<C-k>', function()
  local lines = utils.visual.get_visual_lines()
  local diff = lines[2] - lines[1]
  local keys = "<Esc><CMD>'<,'>m '>-" .. tostring(diff + 2) .. '<CR>gv=gv'
  vim.api.nvim_feedkeys(utils.keys.escape_keys(keys), 'v', false)
end, 'Move selected lines up')
Keymaps.noremap({ 'v' }, '<C-j>', function()
  local lines = utils.visual.get_visual_lines()
  local diff = lines[2] - lines[1]
  local keys = "<Esc><CMD>'<,'>m '<+" .. tostring(diff + 1) .. '<CR>gv=gv'
  vim.api.nvim_feedkeys(utils.keys.escape_keys(keys), 'v', false)
end, 'Move selected lines down')
