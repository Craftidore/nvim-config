-- [nfnl] lua/llm/codecompanion-config.fnl
local vim = _G.vim
local utils = _G.vim.g.utils
local use_ollama = false
local chat_adapter
if use_ollama then
  chat_adapter = {name = "ollama", model = "qwen3:4b"}
else
  chat_adapter = {name = "copilot", model = "claude-opus-4.6"}
end
if utils.is_machmotion() then
  local function _2_(args)
    local chat = require("codecompanion").buf_get_chat(args.data.bufnr)
    local function _3_(c, data)
      local tokens = require("codecompanion.utils.tokens")
      local max_tokens = 12000
      if (data.for_llm and (tokens.calculate(data.for_llm) > max_tokens)) then
        local max_chars = (max_tokens * 6)
        data["for_llm"] = (data.for_llm:sub(1, max_chars) .. "\n\n[Output truncated]")
        data["for_user"] = data.for_llm
        return vim.notify(string.format("Tool output from '%s' truncated (~%d tokens)", data.tool, max_tokens), vim.log.levels.WARN)
      else
        return nil
      end
    end
    return chat:add_callback("on_tool_output", _3_)
  end
  vim.api.nvim_create_autocmd("User", {pattern = "CodeCompanionChatCreated", callback = _2_})
  local function _5_(args)
    local chat = require("codecompanion").buf_get_chat(args.data.bufnr)
    local function _6_(c, data)
      local context_window = (data.adapter.meta and data.adapter.meta.context_window)
      if context_window then
        local usage = (data.estimated_tokens / context_window)
        if (usage > 0.8) then
          return vim.notify(string.format("Context window %.0f%% full", (usage * 100)), vim.log.levels.WARN)
        else
          return nil
        end
      else
        return nil
      end
    end
    return chat:add_callback("on_checkpoint", _6_)
  end
  vim.api.nvim_create_autocmd("User", {pattern = "CodeCompanionChatCreated", callback = _5_})
  local function _9_(args)
    local chat = require("codecompanion").buf_get_chat(args.data.bufnr)
    local function _10_(c, data)
      vim.notify("LLM returned a response.", vim.log.levels.INFO)
      return vim.cmd("!notify-send 'LLM returned a response'")
    end
    return chat:add_callback("on_ready", _10_)
  end
  vim.api.nvim_create_autocmd("User", {pattern = "CodeCompanionChatCreated", callback = _9_})
  local function _11_(message, adapter, context)
    return string.format("<prompt>%s</prompt>", message)
  end
  return {"olimorris/codecompanion.nvim", version = "^19.6.0", dependencies = {"github/copilot.vim"}, opts = {rules = {machmotion_rules = {description = "Rules related to machmotion details involving my specific machine", files = {{path = "/run/media/craftidore/AltDrive/mach/rules/", files = "*.md"}}}, copilot_rules = {description = "copilot rules, used by the rest of the company", files = {".github/copilot-instructions.md"}}, opts = {chat = {autoload = {"copilot_rules", "machmotion_rules"}}}}, interactions = {chat = {adapter = chat_adapter, tools = {run_command = {opts = {allowed_in_yolo_mode = true}}, opts = {default_tools = {"agent"}}}, opts = {prompt_decorator = _11_}}}}, keys = {{"<leader>oa", "<CMD>CodeCompanionChat<CR>", mode = "n", desc = "Open CodeCompanion Chat"}}}
else
  return {}
end
