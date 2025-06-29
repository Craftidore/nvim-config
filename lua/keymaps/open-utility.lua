local utils = vim.g.utils
local Keymaps = utils.keymaps

-- NOTE: Open

utils.defer.add_deferred(function()
  utils.keymaps.wk_add({
    { '<leader>o', group = '[O]pen' },
  })
end, 'which-key')

-- Better z=
Keymaps.noremap('n', '<leader>oz', '<CMD>WhichKey<CR>z=', 'Open Spell Suggest Picker ([z]= alias)')
Keymaps.noremap(
  'n',
  '<leader>oc',
  '<CMD>copen<CR><C-w>' .. tostring(vim.g.quickfix_auto_height ~= nil and vim.g.quickfix_auto_height or 3) .. '_',
  'Open Qui[c]kfix (:copen alias)'
)

-- Open Scratch Buf
Keymaps.noremap('n', '<leader>ox', function()
  utils.scratch.get_scratch('lox_buf')
end, 'Open Scratch [x] Buffer')
