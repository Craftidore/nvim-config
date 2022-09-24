local api = vim.api
local utils = require("utils") -- this contains nothing right now
vim.g.mapleader = " "

local expected_ver = "0.7.2"
-- check for neovim compatibility soon

require("keybinds.keybinds")
require("settings.settings")
require("plugins.packer.main")
require("plugins.coc.main")
require("plugins.camelcasemotion.main")
require("plugins.treesitter.main")

-- CamelCaseTest
