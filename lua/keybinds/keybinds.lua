local api = vim.api

local noremap = { noremap = true }
local default = { noremap = true, silent = true }

api.nvim_set_keymap("n", ":", "q:i", default)
api.nvim_set_keymap("n", "ZZ", ":w<CR>", default)
api.nvim_set_keymap("n", "ZZ", ":q<CR>", default)
api.nvim_set_keymap("n", "ZF", ":wq<CR>", default)
api.nvim_set_keymap("n", "<F3>", ":nohl<CR>", default)

-- <leader>; adds ; to the end of the line without changing cursor position. Same for , : " ' ( ) [ ] { }
local api = vim.api
local trailingKeys = {",", ";", ":", '"', "'", "(", ")", "[", "]", "{", "}"}
for i = 1, #trailingKeys do
    api.nvim_set_keymap("n", "<leader>"..trailingKeys[i], "mzA"..trailingKeys[i].."<Esc>`z", {expr = false, noremap = flase})
end
api.nvim_set_keymap("n", "X", 'mz$"_x`z', {expr = false, noremap = false}) -- Remove last character from line

-- Better window navigation 
api.nvim_set_keymap("n", "<C-h>", "<C-w>h", default)
api.nvim_set_keymap("n", "<C-j>", "<C-w>j", default)
api.nvim_set_keymap("n", "<C-k>", "<C-w>k", default)
api.nvim_set_keymap("n", "<C-l>", "<C-w>l", default)

-- Better copy-all
api.nvim_set_keymap("n", "<leader>a", "mzggVG\"+y`z", default)

-- Better copy && paste
api.nvim_set_keymap("n", "<leader>y", [["+y]], noremap)
api.nvim_set_keymap("v", "<leader>y", [["+y]], noremap)
api.nvim_set_keymap("n", "<leader>Y", [["+Y]], noremap)
api.nvim_set_keymap("v", "<leader>Y", [["+Y]], noremap)
api.nvim_set_keymap("n", "<leader>p", [["+p]], noremap)
api.nvim_set_keymap("v", "<leader>p", [["+p]], noremap)
api.nvim_set_keymap("n", "<leader>P", [["+P]], noremap)
api.nvim_set_keymap("v", "<leader>P", [["+P]], noremap)
