-- [nfnl] lua/plugins/harpoon-config.fnl
local utils = vim.g.utils
local function make_cmd(key, func, desc)
  return {key, func, desc = desc, mode = "n"}
end
local function harpoon_add()
  local harpoon = require("harpoon")
  return harpoon:list():add()
end
local function harpoon_show_list()
  local harpoon = require("harpoon")
  return harpoon.ui:toggle_quick_menu(harpoon:list())
end
local function harpoon_go_to(num)
  local harpoon = require("harpoon")
  return harpoon:list():select(num)
end
local function harpoon_next()
  local harpoon = require("harpoon")
  return harpoon:list():next()
end
local function harpoon_prev()
  local harpoon = require("harpoon")
  return harpoon:list():prev()
end
local Harpoon
local function _1_()
  return harpoon_go_to(1)
end
local function _2_()
  return harpoon_go_to(2)
end
local function _3_()
  return harpoon_go_to(3)
end
local function _4_()
  return harpoon_go_to(4)
end
local function _5_()
  return harpoon_go_to(5)
end
Harpoon = {"ThePrimeagen/harpoon", branch = "harpoon2", dependencies = {"nvim-lua/plenary.nvim"}, keys = {make_cmd("<leader>hh", harpoon_add, "Harpoon: Add to list"), make_cmd("<leader>ho", harpoon_show_list, "Harpoon: Show list"), make_cmd("<leader>ha", _1_, "Harpoon: GoTo 1"), make_cmd("<leader>hs", _2_, "Harpoon: GoTo 2"), make_cmd("<leader>hd", _3_, "Harpoon: GoTo 3"), make_cmd("<leader>hf", _4_, "Harpoon: GoTo 4"), make_cmd("<leader>hg", _5_, "Harpoon: GoTo 5"), make_cmd("<leader>hn", harpoon_next, "Harpoon: Next"), make_cmd("<leader>hp", harpoon_prev, "Harpoon: Prev"), make_cmd("<leader>hl", "<CMD>b#<CR>", "Harpoon: Swap-to-previous-buffer (not harpoon)")}, opts = {}}
local function _6_()
  if utils.plugins.has_plugin("harpoon") then
    return utils.keymaps.wk_add({{"<leader>h", group = "[H]arpoon"}})
  else
    return nil
  end
end
utils.defer.add_deferred(_6_, "which-key")
return Harpoon
