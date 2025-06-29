local utils = vim.g.utils
local Keymaps = utils.keymaps

-- NOTE: Trailing Punctuation
--       (no namespace; <leader>{punctuation})

local trailingKeys = { ',', ';', ':', '"', "'", '(', ')', '[', ']', '{', '}', '\\', '/', '.' }
for i = 1, #trailingKeys do
  local key = trailingKeys[i]
  Keymaps.noremap('n', '<leader>' .. key, 'mzA' .. key .. '<Esc>`z', 'Add ' .. key .. ' to end of current line')
  utils.defer.add_deferred(function()
    utils.keymaps.wk_add({
      { '<leader>' .. key, hidden = true },
    })
  end, 'which-key')
end
