-- [nfnl] lua/llm/codecompanion-config.fnl
local utils = _G.vim.g.utils
if utils.is_machmotion() then
  local function _1_(ctx)
    return (ctx.default_system_prompt .. "Additional Context:\nThe user's name is Craftidore, and you should address him.")
  end
  return {"olimorris/codecompanion.nvim", version = "^19.0.0", dependencies = {}, opts = {interactions = {chat = {adapter = {name = "ollama", model = "qwen3:4b"}, opts = {system_prompt = _1_}}}}}
else
  return {}
end
