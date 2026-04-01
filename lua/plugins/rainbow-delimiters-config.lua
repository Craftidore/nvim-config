-- [nfnl] lua/plugins/rainbow-delimiters-config.fnl
local function _1_(_, opts)
  return require("rainbow-delimiters.setup").setup(opts)
end
return {"HiPhish/rainbow-delimiters.nvim", opts = {strategy = {["''"] = "rainbow-delimiters.strategy.global", vim = "rainbow-delimiters.strategy.local"}, query = {["''"] = "rainbow-delimiters", lua = "rainbow-blocks"}, priority = {["''"] = 110, lua = 210}, highlight = {"RainbowDelimiterYellow", "RainbowDelimiterBlue", "RainbowDelimiterOrange", "RainbowDelimiterGreen", "RainbowDelimiterViolet", "RainbowDelimiterCyan", "RainbowDelimiterRed"}}, config = _1_}
