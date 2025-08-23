-- [nfnl] lua/keymaps/keymaps.fnl
local utils = _G.vim.g.utils
local Keymaps = utils.keymaps
return Keymaps.noremap("n", "<M-CR>", "cl<CR><Esc>", "Break-line here, deleting character beneath cursor")
