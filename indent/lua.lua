local utils = vim.g.utils
local lua_width = 2
if utils.is_machmotion() then
  lua_width = 4
end

vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = lua_width
vim.opt_local.softtabstop = lua_width

-- According to the docs, I should be setting b:undo_indent here, but it's getting set to something else and that's taking priority
