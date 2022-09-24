local api = vim.api
vim.cmd([[filetype plugin on
filetype indent on
]])

vim.cmd([[set number]]) -- TODO Fix this later!!!
vim.cmd([[set relativenumber]])

local tab_options = { "tabstop", "softtabstop", "shiftwidth" }
local tab_width = 4
for i = 1, #tab_options do
	api.nvim_set_option(tab_options[i], tab_width)
end
api.nvim_set_option("expandtab", true)
