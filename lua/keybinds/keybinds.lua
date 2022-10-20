Keymaps = require('keybinds.utils')

Keymaps.silent("n", ":", "q:i")
Keymaps.silent("n", "ZZ", ":w<CR>")
Keymaps.silent("n", "ZQ", ":q<CR>")
Keymaps.silent("n", "ZF", ":wq<CR>")
Keymaps.silent("n", "<F3>", ":nohl<CR>")

-- <leader>; adds ; to the end of the line without changing cursor position. Same for , : " ' ( ) [ ] { }
local trailingKeys = {",", ";", ":", '"', "'", "(", ")", "[", "]", "{", "}", "\\"}
for i = 1, #trailingKeys do
    Keymaps.noremap("n", "<leader>"..trailingKeys[i], "mzA"..trailingKeys[i].."<Esc>`z")
end
Keymaps.noremap("n", "X", 'mz$"_x`z') -- Remove last character from line

-- Better window navigation 
Keymaps.silent("n", "<C-h>", "<C-w>h")
Keymaps.silent("n", "<C-j>", "<C-w>j")
Keymaps.silent("n", "<C-k>", "<C-w>k")
Keymaps.silent("n", "<C-l>", "<C-w>l")

-- Better copy-all
Keymaps.silent("n", "<leader>a", "mzggVG\"+y`z")

-- Better copy && paste
Keymaps.silent("n", "<leader>y", [["+y]])
Keymaps.silent("v", "<leader>y", [["+y]])
Keymaps.silent("n", "<leader>Y", [["+Y]])
Keymaps.silent("v", "<leader>Y", [["+Y]])
Keymaps.silent("n", "<leader>p", [["+p]])
Keymaps.silent("v", "<leader>p", [["+p]])
Keymaps.silent("n", "<leader>P", [["+P]])
Keymaps.silent("v", "<leader>P", [["+P]])

local gotoModes = {
    "n",
    "o"
}
local selectionKeys = {
    {"g", "f"},
    {"G", "F"},
    {"t", "t"},
    {"T", "T"}
}
local gotoKeys = {
    {"C", "{"},
    {"c", "}"},
    {"B", "["},
    {"b", "]"},
    {"P", "("},
    {"p", ")"}
}
for i = 1, #selectionKeys do
    for j = 1, #gotoKeys do
        for m = 1, #gotoModes do
            Keymaps.noremap(gotoModes[m], "<leader>"..selectionKeys[i][1]..gotoKeys[j][1], selectionKeys[i][2]..gotoKeys[j][2])
        end
    end
end

