-- [nfnl] lua/autocmd/colorscheme.fnl
local augroup = _G.vim.api.nvim_create_augroup
local autocmd = _G.vim.api.nvim_create_autocmd
local group = "colorscheme"
local function colors_name()
  return _G.vim.g.colors_name
end
local function run_cmd(command)
  return _G.vim.cmd(command)
end
augroup(group, {clear = true})
local function _1_(ev)
  if ((colors_name() == "sonokai") or string.find(ev.match, "kanagawa")) then
    run_cmd("highlight clear")
  else
  end
  return nil
end
autocmd({"ColorschemePre"}, {group = group, callback = _1_})
local function _3_(ev)
  if ((ev.match == "minicyan") or (ev.match == "minischeme")) then
    local nvim_get_hl = _G.vim.api.nvim_get_hl
    local nvim_set_hl = _G.vim.api.nvim_set_hl
    local cline_hl = nvim_get_hl(0, {name = "CursorLine", create = false})
    nvim_set_hl(0, "CursorLineSign", {ctermbg = cline_hl.ctermbg, bg = cline_hl.bg})
  else
  end
  return nil
end
autocmd({"Colorscheme"}, {group = group, callback = _3_})
local function _5_(ev)
  local nvim_set_hl = _G.vim.api.nvim_set_hl
  nvim_set_hl(0, "BufferManagerModified", {fg = "#add8e6"})
  return nil
end
return autocmd({"Colorscheme"}, {group = group, callback = _5_})
