-- [nfnl] lua/llm/codecompanion-config.fnl
local vim = _G.vim
local utils = _G.vim.g.utils
local prompt_source_dir = (vim.fn.stdpath("config") .. "/prompts/source")
local use_ollama = false
local ollama_adapter = {name = "ollama", model = "qwen3:4b"}
local ollama_noreason_adapter = {name = "ollama", model = "llama3.2:3b"}
local chat_adapter
if use_ollama then
  chat_adapter = ollama_adapter
else
  chat_adapter = {name = "copilot", model = "claude-sonnet-4.6"}
end
local extra_system_prompt
do
  local extra_system_prompt_path = (prompt_source_dir .. "/extra-system-prompt.md")
  local f = assert(io.open(extra_system_prompt_path, "r"))
  local t = f:read("*all")
  f:close()
  extra_system_prompt = t
end
local update_system_prompt
local function _2_(ctx)
  return (ctx.default_system_prompt .. extra_system_prompt)
end
update_system_prompt = _2_
if utils.is_machmotion() then
  local function _3_()
    if utils.plugins.has_plugin("codecompanion") then
      return utils.keymaps.wk_add({{"gc", group = "CodeCompanion (+ Comments)"}})
    else
      return nil
    end
  end
  utils.defer.add_deferred(_3_, "which-key")
  local function _5_(args)
    local chat = require("codecompanion").buf_get_chat(args.data.bufnr)
    local function _6_(c, data)
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
    return chat:add_callback("on_tool_output", _6_)
  end
  vim.api.nvim_create_autocmd("User", {pattern = "CodeCompanionChatCreated", callback = _5_})
  local function _8_(args)
    local chat = require("codecompanion").buf_get_chat(args.data.bufnr)
    local function _9_(c, data)
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
    return chat:add_callback("on_checkpoint", _9_)
  end
  vim.api.nvim_create_autocmd("User", {pattern = "CodeCompanionChatCreated", callback = _8_})
  local function _12_(args)
    local chat = require("codecompanion").buf_get_chat(args.data.bufnr)
    local function _13_(c, data)
      vim.notify("LLM returned a response.", vim.log.levels.INFO)
      return vim.cmd("!notify-send 'LLM returned a response'")
    end
    return chat:add_callback("on_ready", _13_)
  end
  vim.api.nvim_create_autocmd("User", {pattern = "CodeCompanionChatCreated", callback = _12_})
  local agent_group_cfg
  local function _14_(group, ctx)
    return (require("codecompanion.config").config.interactions.chat.tools.groups.agent.system_prompt(nil, ctx) .. extra_system_prompt)
  end
  agent_group_cfg = {description = "Agent - Can run code, edit code and modify files on your behalf", system_prompt = _14_, tools = {"ask_questions", "create_file", "delete_file", "file_search", "get_changed_files", "get_diagnostics", "grep_search", "insert_edit_into_file", "read_file", "run_command"}, opts = {collapse_tools = true, ignore_system_prompt = true, ignore_tool_system_prompt = true}}
  local function _15_(message, adapter, context)
    return string.format("<prompt>%s</prompt>", message)
  end
  local function _16_()
    local cc_adapters = require("codecompanion.adapters")
    return cc_adapters.extend("anthropic", {env = {api_key = "ANTHROPIC_KEY"}})
  end
  return {"olimorris/codecompanion.nvim", version = "^19.6.0", dependencies = {"github/copilot.vim", "ravitemer/codecompanion-history.nvim", {"HakonHarnes/img-clip.nvim", event = "VeryLazy", opts = {filetypes = {codecompanion = {dir_path = "/tmp/nvim/img-clip.nvim/", template = "[Image]($FILE_PATH)", use_absolute_path = true, prompt_for_file_name = false}}}}}, opts = {rules = {machmotion_rules = {description = "Rules related to machmotion details involving my specific machine", files = {{path = "/run/media/craftidore/AltDrive/mach/rules/", files = "*.md"}}}, copilot_rules = {description = "copilot rules, used by the rest of the company", files = {".github/copilot-instructions.md"}}, opts = {chat = {autoload = {"copilot_rules", "machmotion_rules"}}}}, interactions = {chat = {adapter = chat_adapter, tools = {run_command = {opts = {allowed_in_yolo_mode = true}}, groups = {["prompted-agent"] = agent_group_cfg}, opts = {default_tools = {"prompted-agent"}}}, opts = {prompt_decorator = _15_, system_prompt = update_system_prompt}, keymaps = {options = {modes = {n = "g?"}, callback = "keymaps.options", description = "Options", hide = true}}}, inline = {adapter = ollama_adapter}}, adapters = {http = {anthropic = _16_}}, mcp = {servers = {["sequental-thinking"] = {cmd = {"npx", "-y", "@modelcontextprotocol/server-sequential-thinking"}}, ["server-memory"] = {cmd = {"npx", "-y", "@modelcontextprotocol/server-memory"}, env = {MEMORY_FILE_PATH = (vim.fn.stdpath("data") .. "/llm-memory.jsonl")}}, ["calc-mcp"] = {cmd = {"npx", "--prefix", "/tmp", "-y", "@coo-quack/calc-mcp@latest"}}, ["chrome-devtools"] = {cmd = {"npx", "-y", "chrome-devtools-mcp@latest", "--browser-url=http://127.0.0.1:9222", "--no-usage-statistics", "--redact-network-headers"}, env = {CHROME_DEVTOOLS_MCP_NO_USAGE_STATISTICS = "true"}}}, opts = {default_servers = {"sequental-thinking", "calc-mcp", "server-memory"}}}, prompt_library = {markdown = {dirs = {(vim.fn.stdpath("config") .. "/prompts/actions"), (vim.fn.environ().HOME .. "/.prompts"), (vim.fn.getcwd() .. "/.craftidore.prompts")}}}, display = {action_palette = {opts = {show_preset_prompts = false}}}, extensions = {history = {opts = {keymap = "<leader>gah", save_chat_keymap = "<leader>gass", auto_save = true, expiration_days = 7, auto_generate_title = true, title_generation_opts = {adapter = ollama_noreason_adapter.name, model = ollama_noreason_adapter.model, refresh_every_n_prompts = 3}, summary = {create_summary_keymap = "<leader>gasc", browse_summaries_keymap = "<leader>gasv", generation_opts = {adapter = ollama_noreason_adapter.name, model = ollama_noreason_adapter.model, context_size = 12000, include_references = false, include_tool_outputs = false}}, memory = {vectorcode_exe = "echo", auto_create_memories_on_summary_generation = false}}, enabled = false}}}, keys = {{"<leader>gat", "<CMD>CodeCompanionChat Toggle<CR>", mode = {"n", "v"}, desc = "Toggle CodeCompanion Chat"}, {"<leader>gaa", "<CMD>CodeCompanionChat<CR>", mode = {"n", "v"}, desc = "Open CodeCompanion Chat"}, {"<leader>gae", "<CMD>CodeCompanionActions<CR>", mode = {"n", "v"}, desc = "CodeCompanion Actions"}, {"<leader>gan", "<CMD>CodeCompanionChat Add<CR>", mode = "v", desc = "Add to CodeCompanion Chat"}, {"<leader>gai", "<CMD>CodeCompanion<CR>", mode = "v", desc = "CodeCompanion Inline"}}}
else
  return {}
end
