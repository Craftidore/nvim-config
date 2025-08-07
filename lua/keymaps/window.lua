-- [nfnl] lua/keymaps/window.fnl
local utils = vim.g.utils
local Keymaps = utils.keymaps
Keymaps.noremap("n", "<C-w>t", "<cmd>tab split<CR>", "[W]indow: Zoom in on current buffer (opens [t]ab)")
return Keymaps.noremap("n", "<C-w>z", "<cmd>tab split<CR>", "[W]indow: [z]oom in on current buffer (opens tab)")
