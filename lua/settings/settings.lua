local opt = vim.opt

-- Disables filetype.vim and enables filetype.lua. Leave this in at your own risk.
-- filetype.vim is enabled by default
--vim.cmd([[" this is a comment
--let g:do_filetype_lua = 1
--let g:did_load_filetypes = 0
--]])

opt.number = true -- TODO Fix this later!!!
opt.relativenumber = true

local tab_options = { "tabstop", "softtabstop", "shiftwidth" }
local tab_width = 4
for i = 1, #tab_options do
	opt[tab_options[i]] = tab_width
end
opt.expandtab = true

opt.hlsearch = false

