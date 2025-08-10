-- [nfnl] lua/plugins/conjure-config.fnl
local utils = _G.vim.g.utils
local g = _G.vim.g
local conjure_config
local function _1_()
  g["conjure#mapping#log_split"] = "els"
  g["conjure#mapping#log_vsplit"] = "elv"
  g["conjure#mapping#log_tab"] = "elt"
  g["conjure#mapping#log_buf"] = "elt"
  g["conjure#mapping#log_tab"] = "elt"
  g["conjure#mapping#log_toggle"] = "elg"
  g["conjure#mapping#log_reset_soft"] = "elr"
  g["conjure#mapping#log_reset_hard"] = "elR"
  g["conjure#mapping#log_jump_to_latest"] = "ell"
  g["conjure#mapping#log_close_visible"] = "elq"
  return nil
end
conjure_config = {"Olical/conjure", init = _1_}
local function _2_()
  if utils.plugins.has_plugin("conjure.main") then
    return utils.keymaps.wk_add({{"<leader>e", group = "[E]val with Conjure"}})
  else
    return nil
  end
end
utils.defer.add_deferred(_2_, "which-key")
return conjure_config
