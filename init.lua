local api = vim.api local utils = require("utils") -- this just contains get_nvim_version right now

require("global")

vim.g.mapleader = " "
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true } )
-- local temp = { {"\"","\""}, {"'","'"}, {"{","}"}, {"(",")"}, {"[","]"}, {"<", ">"} }
-- for i = 1, #temp do
--     vim.keymap.set("i", temp[i][1], temp[i][1] .. temp[i][2] .. "<Esc>i", { noremap = true })
-- end

-- disabling netrw at the start on init.lua is strongly advised for nvim-tree
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local expected_ver = "0.9.4"
local nvim_ver = utils.get_nvim_version()

if nvim_ver ~= expected_ver then
    local msg = string.format("Unsupported nvim version: expect %s, but got %s instead!", expected_ver, nvim_ver)
    api.nvim_err_writeln(msg)
    return
end

-- -- sonokai theme
require("plugins.sonokai.main")

require("keybinds.keybinds")
require("settings.settings")
require("settings.filetypes")
-- require("plugins.coc.main")
require("plugins.camelcasemotion.main")
require("plugins.treesitter.main")
require("plugins.vimtex.main")
-- --require("plugins.nvim-ts-rainbow") -- requires nvim-treesitter
require("plugins.lualine.main")
require("plugins.nvim-tree.main")
require("plugins.leap.main")
-- -- require("plugins.wilder.main")
-- -- require("plugins.sandwich.main")
-- -- require("plugins.firenvim.main")
require("plugins.telescope.main")
require("plugins.genghis.main")
-- -- require("plugins.dressing.main")
require("plugins.notify.main")
require("plugins.tabby.main")
require("plugins.impatient.main")
require("plugins.vim-commentary.main")
require("plugins.textobj.main")
-- require("plugins.vim-signature.main")
require("plugins.vim-repeat.main")
require("plugins.lsp-zero.main")
require("plugins.todo-highlight.main")
-- require("plugins.nabla.main")

require("plugins.packer.main")

--[====[
Tech-debt stuff:
local function keymap (mode, key, result)
    vim.keymap.set(mode, key, result, {noremap = true} )
end

vim.opt.tabstop = 4

Pseudo's reload config:
function reloadConfig()
    for name,_ in pairs(package.loaded) do
        package.loaded[name] = nil
    end
    dofile(vim.env.MYVIMRC)
    vim.notify("Neovim config reloaded.", vim.log.levels.INFO)
end
keymap("n", "<leader>r", ":w<CR>:lua reloadConfig()<CR>")
--]====]

-- Disabled because it borks with the plugins I have enabled -- <leader>r to reload config
-- vim.keymap.set("n", "<leader>r", ":lua require('utils').reloadConfig()<CR>", { noremap = true, silent = true })

function LeaveVisualMode()
    local escKey = vim.api.nvim_replace_termcodes("<Esc>", false, true, true)
    vim.api.nvim_feedkeys(escKey, "nx", false)
end

