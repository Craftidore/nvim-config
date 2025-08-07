-- [nfnl] lua/plugins/spider_config.fnl
local vim = _G.vim
local utils = vim.g.utils
local spider_config = {"chrisgrieser/nvim-spider"}
spider_config.last_spider = "w"
local default_modes = {"n", "o", "x"}
local function spider_motion(key)
  return ("<cmd>lua " .. "require('plugins.spider_config').last_spider = " .. key .. "; " .. "require('spider').motion('" .. key .. "')" .. "<CR>")
end
local function do_last_spider()
  return spider_motion(spider_config.last_spider)
end
spider_config.keys = {{"<leader>sw", spider_motion("w"), mode = default_modes, desc = "[S]pider: CamelCase [w]"}, {"<leader>se", spider_motion("e"), mode = default_modes, desc = "[S]pider: CamelCase [e]"}, {"<leader>sb", spider_motion("b"), mode = default_modes, desc = "[S]pider: CamelCase [b]"}, {"<leader>sn", do_last_spider(), mode = default_modes, desc = "[S]pider: Repeat last spider command"}}
local function _1_()
  if utils.plugins.has_plugin("spider") then
    return utils.keymaps.wk_add({{"<leader>s", group = "[S]pider Motions"}})
  else
    return nil
  end
end
utils.defer.add_deferred(_1_, "which-key")
return spider_config
