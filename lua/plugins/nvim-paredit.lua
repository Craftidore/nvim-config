-- [nfnl] lua/plugins/nvim-paredit.fnl
local g = _G.vim.g
local utils = g.utils
local nvim_paredit
local function _1_()
  local paredit = require("nvim-paredit")
  return require("nvim-paredit").setup({keys = {["<localleader>s@"] = {paredit.unwrap.unwrap_form_under_cursor, "Splice sexp"}, ["<localleader>s)l"] = {paredit.api.slurp_forwards, "Slurp forwards"}, ["<localleader>s(l"] = {paredit.api.barf_backwards, "Barf backwards"}, ["<localleader>s)h"] = {paredit.api.barf_forwards, "Barf forwards"}, ["<localleader>s(h"] = {paredit.api.slurp_backwards, "Slurp backwards"}, ["<localleader>sel"] = {paredit.api.drag_element_forwards, "Drag element right"}, ["<localleader>seh"] = {paredit.api.drag_element_backwards, "Drag element left"}, ["<localleader>spl"] = {paredit.api.drag_pair_forwards, "Drag element pairs right"}, ["<localleader>sph"] = {paredit.api.drag_pair_backwards, "Drag element pairs left"}, ["<localleader>sfl"] = {paredit.api.drag_form_forwards, "Drag form right"}, ["<localleader>sfh"] = {paredit.api.drag_form_backwards, "Drag form left"}, ["<localleader>so"] = {paredit.api.raise_form, "Raise form"}, ["<localleader>sO"] = {paredit.api.raise_form, "Raise element"}, ["<localleader>sE"] = {paredit.api.move_to_next_element_tail, "Jump to next element tail", mode = {"n", "x", "o", "v"}, repeatable = false}, ["<localleader>sW"] = {paredit.api.move_to_next_element_head, "Jump to next element head", mode = {"n", "x", "o", "v"}, repeatable = false}, ["<localleader>sB"] = {paredit.api.move_to_prev_element_head, "Jump to previous element head", mode = {"n", "x", "o", "v"}, repeatable = false}, ["<localleader>sgE"] = {paredit.api.move_to_prev_element_tail, "Jump to previous element tail", mode = {"n", "x", "o", "v"}, repeatable = false}, ["<localleader>sj("] = {paredit.api.move_to_parent_form_start, "Jump to parent form's head", mode = {"n", "x", "v"}, repeatable = false}, ["<localleader>sj)"] = {paredit.api.move_to_parent_form_end, "Jump to parent form's tail", mode = {"n", "x", "v"}, repeatable = false}, ["<localleader>sjT"] = {paredit.api.move_to_top_level_form_head, "Jump to top level form's head", mode = {"n", "x", "v"}, repeatable = false}, af = {paredit.api.select_around_form, "Around form", mode = {"o", "v"}, repeatable = false}, ["if"] = {paredit.api.select_in_form, "In form", mode = {"o", "v"}, repeatable = false}, aF = {paredit.api.select_around_top_level_form, "Around top level form", mode = {"o", "v"}, repeatable = false}, iF = {paredit.api.select_in_top_level_form, "In top level form", mode = {"o", "v"}, repeatable = false}, ae = {paredit.api.select_element, "Around element", mode = {"o", "v"}, repeatable = false}, ie = {paredit.api.select_element, "Element", mode = {"o", "v"}, repeatable = false}, ["("] = false, [")"] = false, ["<("] = false, ["<)"] = false, ["<e"] = false, ["<f"] = false, ["<localleader>@"] = false, ["<localleader>O"] = false, ["<localleader>o"] = false, ["<p"] = false, [">("] = false, [">)"] = false, [">e"] = false, [">f"] = false, [">p"] = false, B = false, E = false, T = false, W = false, gE = false}})
end
nvim_paredit = {"julienvincent/nvim-paredit", config = _1_}
local function _2_()
  if utils.plugins.has_plugin("nvim-paredit") then
    utils.keymaps.wk_add({{"<localleader>s", group = "ParEdit [S]exp Operations"}})
    utils.keymaps.wk_add({{"<localleader>s)", group = "Slurp/Barf Forwards [)]"}})
    utils.keymaps.wk_add({{"<localleader>s(", group = "Slurp/Barf Backwards [(]"}})
    utils.keymaps.wk_add({{"<localleader>se", group = "Drag [e]lement"}})
    utils.keymaps.wk_add({{"<localleader>sp", group = "Drag [p]air"}})
    utils.keymaps.wk_add({{"<localleader>sf", group = "Drag [f]orm"}})
    utils.keymaps.wk_add({{"<localleader>sg", group = "Jump to previous element tail"}})
    return utils.keymaps.wk_add({{"<localleader>sj", group = "Jump to ___"}})
  else
    return nil
  end
end
utils.defer.add_deferred(_2_, "which-key")
return nvim_paredit
