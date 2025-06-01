-- # Nvim-Config--Keybinds

Keymaps = require('keybinds.utils');

Keymaps.noremap("i", "jj", '<Esc>');
Keymaps.noremap("i", "jk", '<Esc>');
vim.cmd([[command! -nargs=* W w]]);
vim.cmd([[command! -nargs=* WQ wq]]);
vim.cmd([[command! -nargs=* Wq wq]]);

-- ## Leader Keys

-- <leader>; adds ; to the end of the line without changing cursor position. Same for , : " ' ( ) [ ] { } \ .
local trailingKeys = {",", ";", ":", '"', "'", "(", ")", "[", "]", "{", "}", "\\", "."}
for i = 1, #trailingKeys do
    Keymaps.noremap("n", "<leader>"..trailingKeys[i], "mzA"..trailingKeys[i].."<Esc>`z");
end
Keymaps.noremap("n", "X", 'mz$"_x`z'); -- Remove last character from line

Keymaps.noremap("n", "<leader><leader>x", "<cmd>w<CR><cmd>source %<CR>")

-- Better copy && paste
Keymaps.noremap("n", "<leader>y", [["+y]]);
Keymaps.noremap("x", "<leader>y", [["+y]]);
Keymaps.noremap("n", "<leader>Y", [["+Y]]);
Keymaps.noremap("x", "<leader>Y", [["+Y]]);
Keymaps.noremap("n", "<leader>p", [["+p]]);
Keymaps.noremap("x", "<leader>p", [["+p]]);
Keymaps.noremap("n", "<leader>P", [["+P]]);
Keymaps.noremap("x", "<leader>P", [["+P]]);
Keymaps.noremap("n", "<leader>d", [["+d]]);
Keymaps.noremap("x", "<leader>d", [["+d]]);
Keymaps.noremap("n", "<leader>D", [["+D]]);
Keymaps.noremap("x", "<leader>D", [["+D]]);
Keymaps.noremap("n", "<leader>c", [["+c]]);
Keymaps.noremap("x", "<leader>c", [["+c]]);
Keymaps.noremap("n", "<leader>C", [["+C]]);
Keymaps.noremap("x", "<leader>C", [["+C]]);

Keymaps.silent("n", "<leader>gu", "mz?[A-Z]<CR><cmd>nohl<CR>gul`z");
Keymaps.silent("n", "<leader>u", "mz~`z");

-- Better copy-all
Keymaps.silent("n", "<leader>a", "mzggVG\"+y`z");

-- ## Functionality-Redefining Keymaps

-- Redefining ZZ/ZQ
Keymaps.silent("n", "ZZ", "<cmd>w<CR>");
Keymaps.silent("n", "ZQ", "<cmd>q<CR>");
Keymaps.silent("n", "ZF", "<cmd>wq<CR>");

-- Redefining : / and ?
function _G.RunIfNotRecording(s1, s2)
    if vim.fn.reg_recording() == "" then
        vim.api.nvim_feedkeys(s1, "n", true);
    else
        vim.api.nvim_feedkeys(s2, "n", true);
    end
end
Keymaps.silent("n", ":", [[<cmd>lua _G.RunIfNotRecording("q:i", ":")<CR>]]);
Keymaps.silent("v", ":", [[<cmd>lua _G.RunIfNotRecording("q:i", ":")<CR>]]);
Keymaps.silent("n", "/", [[<cmd>lua _G.RunIfNotRecording("q/i\\v", "/")<CR>]]);
Keymaps.silent("v", "/", [[<cmd>lua _G.RunIfNotRecording("q/i\\v", "/")<CR>]]);
Keymaps.silent("n", "?", [[<cmd>lua _G.RunIfNotRecording("q?i\\v", "?")<CR>]]);
Keymaps.silent("v", "?", [[<cmd>lua _G.RunIfNotRecording("q?i\\v", "?")<CR>]]);

-- <F3> removes highlights after a search
Keymaps.silent("n", "<F3>", "<cmd>nohl<CR>");

-- Redefining za
Keymaps.noremap("n", "za", "1z=");
--
-- Redefining M (so that J can be used for 6j)
Keymaps.noremap("n", "M", "J");
Keymaps.noremap("v", "M", "J");

-- Redefining J/K soas to not use numbers
Keymaps.noremap("n", "J", "6j");
Keymaps.noremap("o", "J", "6j");
Keymaps.noremap("v", "J", "6j");
Keymaps.noremap("n", "K", "6k");
Keymaps.noremap("o", "K", "6k");
Keymaps.noremap("v", "K", "6k");

-- local gotoModes = {
--     "n",
--     "o"
-- }
-- local selectionKeys = {
--     {"g", "f"},
--     {"G", "F"},
--     {"t", "t"},
--     {"T", "T"}
-- }
-- local gotoKeys = {
--     {"C", "{"},
--     {"c", "}"},
--     {"B", "["},
--     {"b", "]"},
--     {"P", "("},
--     {"p", ")"}
-- }
-- for i = 1, #selectionKeys do
--     for j = 1, #gotoKeys do
--         for m = 1, #gotoModes do
--             Keymaps.noremap(gotoModes[m], "<leader>"..selectionKeys[i][1]..gotoKeys[j][1], selectionKeys[i][2]..gotoKeys[j][2])
--         end
--     end
-- end

-- local selectionModes = {
--     {"a", "a"},
--     {"i", "i"}
-- }

-- local objectKeys = {
--     {"C", "{"},
--     {"c", "{"},
--     {"B", "["},
--     {"b", "["},
--     {"P", "("},
--     {"p", "("}
-- }
-- for i = 1, #objectKeys do
--     for j = 1, #selectionModes do
--         Keymaps.noremap("o", "<leader>"..selectionModes[j][1]..objectKeys[i][1], selectionModes[j][2]..objectKeys[i][2])
--     end
-- end
