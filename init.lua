local api = vim.api
local utils = require("utils") -- this contains nothing right now
vim.g.mapleader = " "

-- disabling netrw at the start on init.lua is strongly advised for nvim-tree
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local expected_ver = "0.7.2"
-- check for neovim compatibility soon

require("keybinds.keybinds")
require("settings.settings")
require("plugins.packer.main")
require("plugins.coc.main")
require("plugins.camelcasemotion.main")
require("plugins.treesitter.main")
--require("plugins.nvim-ts-rainbow") -- requires nvim-treesitter
require("plugins.lualine.main")
require("plugins.nvim-tree.main")

-- CamelCaseTest
