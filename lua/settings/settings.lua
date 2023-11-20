local opt = vim.opt
local fn = vim.fn

-- Disables filetype.vim and enables filetype.lua. Leave this in at your own risk.
-- filetype.vim is enabled by default
--vim.cmd([[" this is a comment
--let g:do_filetype_lua = 1
--let g:did_load_filetypes = 0
--]])

opt.number = true -- TODO Fix this later!!!
opt.relativenumber = true
-- taken from https://nanotipsforvim.prose.sh/use-cursorcolumn-to-help-you-learn-gm
local function gmColumn()
    return math.floor(fn.winwidth("%") / 2)-2 -- '-2' to get to the correct position
end
local textMax = 80
opt.colorcolumn = {gmColumn(), textMax}
vim.api.nvim_create_autocmd({"VimResized", "WinScrolled"}, {
     callback = function() vim.opt.colorcolumn = {gmColumn(), textMax} end,
})

local tab_options = { "tabstop",
    "softtabstop", "shiftwidth" }
-- opt.vartabstop = {2,4,4,4,8,20}
local tab_width = 4
for i = 1, #tab_options do
	opt[tab_options[i]] = tab_width
end
opt.expandtab = true

opt.hlsearch = false
opt.hidden = false
opt.undofile = true
opt.scrolloff = 5
opt.sidescrolloff = 20

opt.wrap =false

opt.cursorline = true
opt.cursorcolumn = true



