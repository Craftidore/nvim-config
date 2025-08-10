-- [nfnl] lua/plugins/mini-config.fnl
local g = _G.vim.g
local mini_config
local function _1_()
  local statusline = require("mini.statusline")
  statusline.setup({use_icons = g.have_nerd_font})
  local function _2_()
    return "%2l:%-2v"
  end
  statusline.section_location = _2_
  local starter = require("mini.starter")
  starter.setup({content_hooks = {starter.gen_hook.adding_bullet(), starter.gen_hook.aligning("center", "center")}, query_updaters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXY0123456789_-.", silent = true})
  local tabline = require("mini.tabline")
  local function _3_(buf_id, label)
    local suffix
    if _G.vim.bo[buf_id].modified then
      suffix = "* "
    else
      suffix = ""
    end
    return (_G.MiniTabline.default_format(buf_id, label) .. suffix)
  end
  tabline.setup({_3_, show_icons = true, tabpage_section = "left"})
  require("mini.notify").setup({lsp_progress = {enable = false}, window = {winblend = g.winblend}})
  _G.vim.notify = require("mini.notify").make_notify()
  return nil
end
mini_config = {"echasnovski/mini.nvim", config = _1_}
return mini_config
