-- [nfnl] lua/keymaps/trailing-keys.fnl
local utils = _G.vim.g.utils
local Keymaps = utils.keymaps
local trailing_keys = {",", ";", ":", "\"", "'", "(", ")", "[", "]", "{", "}", "\\", "/", "."}
for i = 1, #trailing_keys do
  local key = trailing_keys[i]
  Keymaps.noremap("n", ("<leader>" .. key), ("mzA" .. key .. "<Esc>`z"), ("Add " .. key .. " to end of current line"))
  local function _1_()
    return utils.keymaps.wk_add({{("<leader>" .. key), hidden = true}})
  end
  utils.defer.add_deferred(_1_, "which-key")
end
return nil
