local utils = vim.g.utils
local Keymaps = utils.keymaps

-- NOTE: System Copy/Paste (<leader>y/c/d/p)

-- Better copy && paste
local copyPasteModes = { 'n', 'x' }
local copyPasteKeys = { 'y', 'p', 'P', 'd', 'D', 'c', 'C' }
for _, m in ipairs(copyPasteModes) do
  for _, k in ipairs(copyPasteKeys) do
    Keymaps.noremap(m, '<leader>' .. k, '"+' .. k, 'Perform ' .. k .. ' to system clipboard')
    utils.defer.add_deferred(function()
      utils.keymaps.wk_add({
        { '<leader>' .. k, hidden = true },
      })
    end, 'which-key')
  end
end

-- Because Y is different *eyerolling*
Keymaps.noremap({ 'n', 'x' }, '<leader>Y', '"+y$', 'Perform Y to system clipboard')
utils.defer.add_deferred(function()
  utils.keymaps.wk_add({ { '<leader>Y', hidden = true } })
end)
