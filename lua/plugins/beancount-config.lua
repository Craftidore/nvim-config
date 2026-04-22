-- [nfnl] lua/plugins/beancount-config.fnl
local function _1_(lazy, _)
  local opts = lazy.opts
  table.insert(opts.sources.default, "beancount")
  opts.sources.providers["beancount"] = {name = "beancount", module = "beancount.completion.blink", score_offset = 100, opts = {trigger_characters = {":", "#", "^", "\"", " "}}}
  return opts
end
local function _2_()
  local beancount = require("beancount")
  return beancount.setup({main_bean_file = "/var/home/craftidore/repos/beans/Main.bean"})
end
return {"hxueh/beancount.nvim", tag = "v1.0.0", ft = {"beancount", "bean"}, dependencies = {{"saghen/blink.cmp", optional = true, opts = _1_}, "L3MON4D3/LuaSnip"}, config = _2_}
