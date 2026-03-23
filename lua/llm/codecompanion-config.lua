-- [nfnl] lua/llm/codecompanion-config.fnl
local utils = _G.vim.g.utils
local use_ollama = false
local chat_adapter
if use_ollama then
  chat_adapter = {name = "ollama", model = "qwen3:4b"}
else
  chat_adapter = {name = "copilot", model = "claude-opus-4.6"}
end
if utils.is_machmotion() then
  return {"olimorris/codecompanion.nvim", version = "^19.6.0", dependencies = {"github/copilot.vim"}, opts = {interactions = {chat = {adapter = chat_adapter}}}}
else
  return {}
end
