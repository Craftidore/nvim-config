-- [nfnl] lua/lsp/blink_config.fnl
local vim = _G.vim
local utils = vim.g.utils
local blink_config
local _1_
if not ((vim.fn.has("win32") == 1) or (vim.fn.executable("make") == 0)) then
  _1_ = "make install_jsregexp"
else
  _1_ = nil
end
local function _3_()
  require("luasnip.loaders.from_vscode").lazy_load()
  return require("luasnip.loaders.from_vscode").lazy_load({paths = {(vim.fn.stdpath("config") .. "/snippets/")}})
end
local function _4_(cmp)
  return cmp.show({providers = {"snippets"}})
end
local function _5_(ctx)
  return (ctx.trigger.initial_kind ~= "trigger_character")
end
local function _6_(_, items)
  return items
end
blink_config = {"saghen/blink.cmp", event = "VimEnter", tag = "v1.3.1", dependencies = {{"L3MON4D3/LuaSnip", version = "2.*", build = _1_, dependencies = {{"rafamadriz/friendly-snippets", config = _3_}}, opts = {}}, {"saghen/blink.compat", version = "2.*", lazy = true, opts = {}}, "folke/lazydev.nvim"}, opts = {keymap = {preset = "none", ["<C-s>"] = {_4_}, ["<C-e>"] = {"hide"}, ["<C-y>"] = {"select_and_accept"}, ["<C-p>"] = {"select_prev", "fallback_to_mappings"}, ["<C-n>"] = {"select_next", "fallback_to_mappings"}, ["<C-j>"] = {"snippet_forward", "fallback"}, ["<C-k>"] = {"snippet_backward", "fallback"}, ["<C-l>"] = {"show_signature", "hide_signature", "fallback"}}}, appearance = {nerd_font_variant = "mono"}, completion = {documentation = {auto_show_delay_ms = 500, auto_show = false}}, sources = {default = {lsp = "path", lazydev = "buffer"}, providers = {snippets = {should_show_items = _5_}, lazydev = {module = "lazydev.integrations.blink", score_offset = 100}}, transform_items = _6_}, snippets = {preset = "luasnip"}, fuzzy = {implementation = "lua"}, signature = {enabled = true}}
return blink_config
