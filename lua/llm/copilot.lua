-- [nfnl] lua/llm/copilot.fnl
local vim = _G.vim
local function _1_(plugin, opts)
  return vim.cmd("Copilot disable")
end
return {"github/copilot.vim", config = _1_}
