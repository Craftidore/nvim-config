-- [nfnl] lua/lsp/lspconfig_config.fnl
local vim = _G.vim
local utils = vim.g.utils
local lsp_config
local function _1_()
  local function _2_(event)
    local map
    local function _3_(keys, func, desc, _3fmode)
      local mode
      if (_3fmode == nil) then
        mode = "n"
      else
        mode = _3fmode
      end
      return vim.keymap.set(mode, keys, func, {buffer = event.buf, desc = desc})
    end
    map = _3_
    local popup_opts = {border = "rounded"}
    map("<leader>lr", vim.lsp.buf.rename, "LSP: [r]ename")
    map("<leader>la", vim.lsp.buf.code_action, "LSP: Code [a]ction", {n = "x"})
    map("<leader>lf", require("telescope.builtin").lsp_references, "LSP: Goto Re[f]erences")
    map("<leader>li", require("telescope.builtin").lsp_implementations, "LSP: Goto [i]mplementation")
    map("<leader>ltd", require("telescope.builtin").lsp_definitions, "LSP: Telescope [d]efinitions")
    map("<leader>ld", vim.lsp.buf.declaration, "LSP: Goto [d]eclaration")
    map("<leader>ltb", require("telescope.builtin").lsp_document_symbols, "LSP: Telescope [b]uffer Symbols")
    map("<leader>ltw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "LSP: Telescope [w]orkspace Symbols")
    map("<leader>ltt", require("telescope.builtin").lsp_type_definitions, "LSP: Telescope [t]ype Definitions")
    local function _5_()
      return vim.lsp.buf.hover(popup_opts)
    end
    map("<leader>ls", _5_, "LSP: Hover detail[s]")
    local function client_supports_method(client, method, bufnr)
      if (vim.fn.has("nvim-0.11") == 1) then
        return client:supports_method(method, bufnr)
      else
        return client.supports_method(method, {bufnr = bufnr})
      end
    end
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if (client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)) then
      local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", {clear = false})
      vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {buffer = event.buf, group = highlight_augroup, callback = vim.lsp.buf.document_highlight})
      vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {buffer = event.buf, group = highlight_augroup, callback = vim.lsp.buf.clear_references})
      local function _7_(event2)
        vim.lsp.buf.clear_references()
        return vim.api.nvim_clear_autocmds({group = "kickstart-lsp-highlight", buffer = event2.buf})
      end
      vim.api.nvim_create_autocmd("LspDetach", {group = vim.api.nvim_create_augroup("kickstart-lsp-detach", {clear = true}), callback = _7_})
    else
    end
    if (client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)) then
      local function _9_()
        return vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({bufnr = event.buf}))
      end
      return map("<leader>lh", _9_, "LSP: Toggle Inlay [h]ints")
    else
      return nil
    end
  end
  vim.api.nvim_create_autocmd("LspAttach", {group = vim.api.nvim_create_augroup("kickstart-lsp-attach", {clear = true}), callback = _2_})
  local _11_
  if vim.g.have_nerd_font then
    _11_ = {text = {[vim.diagnostic.severity.ERROR] = "\243\176\133\154 ", [vim.diagnostic.severity.WARN] = "\243\176\128\170 ", [vim.diagnostic.severity.INFO] = "\243\176\139\189 ", [vim.diagnostic.severity.HINT] = "\243\176\140\182 "}}
  else
    _11_ = {}
  end
  local function _13_(diagnostic)
    local diagnostic_message = {[vim.diagnostic.severity.ERROR] = diagnostic.message, [vim.diagnostic.severity.WARN] = diagnostic.message, [vim.diagnostic.severity.INFO] = diagnostic.message, [vim.diagnostic.severity.HINT] = diagnostic.message}
    return diagnostic_message[diagnostic.severity]
  end
  vim.diagnostic.config({severity_sort = true, float = {border = "rounded", source = "if_many"}, underline = {severity = vim.diagnostic.severity.ERROR}, signs = _11_, virtual_text = {source = "if_many", spacing = 2, format = _13_}})
  local capabilities = require("blink.cmp").get_lsp_capabilities()
  local servers = {clangd = {cmd = {"clangd"}, capabilities = capabilities, init_options = {fallbackFlags = {"-std=c++20"}}, filetypes = {"h", "hpp", "c", "cpp"}}, lua_ls = {settings = {Lua = {completion = {callSnippet = "Replace"}}, diagnostics = {disable = {"missing-fields"}}}}}
  local ensure_installed
  local function _14_()
    if (servers ~= nil) then
      return servers
    else
      return {}
    end
  end
  ensure_installed = vim.tbl_keys(_14_())
  vim.list_extend(ensure_installed, {"stylua", "cpplint", "typos", "editorconfig-checker"})
  require("mason-tool-installer").setup({ensure_installed = ensure_installed})
  local function _15_(server_name)
    local server
    if (servers[server_name] ~= nil) then
      server = servers[server_name]
    else
      server = {}
    end
    local function _17_()
      if (server.capabilities ~= nil) then
        return server.capabilities
      else
        return {}
      end
    end
    server["capabilities"] = vim.tbl_deep_extend("force", {}, capabilities, _17_())
    return require("lspconfig")[server_name].setup(server)
  end
  return require("mason-lspconfig").setup({automatic_enable = true, ensure_installed = {}, handlers = {_15_}, automatic_installation = false})
end
lsp_config = {"neovim/nvim-lspconfig", dependencies = {{"mason-org/mason.nvim", tag = "v2.0.0", opts = {}, keys = {{"<leader>om", "<CMD>Mason<CR>", mode = "n", desc = "Open [m]ason"}}}, "mason-org/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim", {"j-hui/fidget.nvim", opts = {}}, "saghen/blink.cmp"}, config = _1_}
local function _18_()
  if utils.plugins.has_plugin("lsp-config") then
    utils.keymaps.wk_add({{"<leader>l", group = "[L]SP"}})
    if utils.plugins.has_plugin("telescope") then
      return utils.keymaps.wk_add({{"<leader>lt", group = "LSP-[t]elescope"}})
    else
      return nil
    end
  else
    return nil
  end
end
utils.defer.add_deferred(_18_, "which-key")
return lsp_config
