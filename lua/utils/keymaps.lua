local keymap = vim.keymap.set
local Keymaps = {
  noremap = function(mode, lhs, rhs, desc)
    if desc == nil then
      desc = 'No description provided'
    end
    keymap(mode, lhs, rhs, { noremap = true, desc = desc })
  end,

  silent = function(mode, lhs, rhs)
    keymap(mode, lhs, rhs, { noremap = true, silent = true })
  end,

  wk_add = function(...)
    if require('utils.plugins').has_plugin('which-key') then
      require('which-key').add(...)
    end
  end,
}

return Keymaps
