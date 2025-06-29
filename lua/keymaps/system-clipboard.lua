local utils = vim.g.utils
local Keymaps = utils.keymaps

-- NOTE: System Copy/Paste (<leader>y/c/d/p)

-- Better copy && paste
local copyPasteModes = { 'n', 'x' }
local copyPasteKeys = { 'y', 'Y', 'p', 'P', 'd', 'D', 'c', 'C' }
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
