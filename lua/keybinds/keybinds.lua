local api = vim.api

api.nvim_set_keymap("n", ":", "q:i", { noremap = true })
api.nvim_set_keymap("n", "ZF", ":w<CR>", { noremap = false })
api.nvim_set_keymap("n", "<F3>", ":nohl<CR>", { noremap = false })

-- <leader>; adds ; to the end of the line without changing cursor position. Same for , : " ' ( ) [ ] { }
local api = vim.api
trailingKeys = {",", ";", ":", '"', "'", "(", ")", "[", "]", "{", "}"}
for i = 1, #trailingKeys do
    api.nvim_set_keymap("n", "<leader>"..trailingKeys[i], "mzA"..trailingKeys[i].."<Esc>`z", {expr = false, noremap = flase})
end
api.nvim_set_keymap("n", "X", 'mz$"_x`z', {expr = false, noremap = false}) -- Remove last character from line


