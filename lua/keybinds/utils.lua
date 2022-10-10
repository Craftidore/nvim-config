Keymaps = {}
local keymap = vim.keymap.set
function Keymaps.noremap(mode, lhs, rhs)
    keymap(mode, lhs, rhs, { noremap = true })
end
function Keymaps.silent(mode, lhs, rhs)
    keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

return Keymaps
