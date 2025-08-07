-- [nfnl] lua/plugins/ripgrep_sub_config.fnl
local function _1_()
  return require("rip-substitute").sub()
end
return {"chrisgrieser/nvim-rip-substitute", cmd = "RipSubstitute", opts = {}, keys = {{"<leader>us", _1_, mode = {"n", "x"}, desc = "\238\172\189 rip substitute"}}}
