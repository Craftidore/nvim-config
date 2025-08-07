-- [nfnl] lua/plugins/leap_config.fnl
local utils = _G.vim.g.utils
local api = _G.vim.api
local noremap = utils.keymaps.noremap
local leap_config
local function _1_()
  local leap = require("leap")
  leap.opts.equivalence_classes = {" \9\13\n", "([{", ")]}", "'\"`"}
  leap.opts.safe_labels = {}
  noremap({"n", "x", "o"}, "s", "<Plug>(leap)", "Leap in current buffer")
  noremap("n", "S", "<Plug>(leap-anywhere)", "Leap in any open window")
  return api.nvim_set_hl(0, "LeapBackdrop", {link = "Comment"})
end
leap_config = {"ggandor/leap.nvim", config = _1_, dependencies = {{"tpope/vim-repeat"}}}
return leap_config
