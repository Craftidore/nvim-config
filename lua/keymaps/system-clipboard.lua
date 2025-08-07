-- [nfnl] lua/keymaps/system-clipboard.fnl
local utils = vim.g.utils
local Keymaps = utils.keymaps
local copy_paste_modes = {"n", "x"}
local copy_paste_keys = {"y", "p", "P", "d", "D", "c", "C"}
for _, m in ipairs(copy_paste_modes) do
  for _0, k in ipairs(copy_paste_keys) do
    Keymaps.noremap(m, ("<leader>" .. k), ("\"+" .. k), ("Perform " .. k .. " to system clipboard"))
    local function _1_()
      return utils.keymaps.wk_add({{("<leader>" .. k), hidden = true}})
    end
    utils.defer.add_deferred(_1_, "which-key")
  end
end
Keymaps.noremap({"n", "x"}, "<leader>Y", "\"+y$", "Perform Y to system clipboard")
local function _2_()
  return utils.keymaps.wk_add({{"<leader>Y", hidden = true}})
end
return utils.defer.add_deferred(_2_)
