-- [nfnl] init.fnl
local vim = _G.vim
vim.g["utils"] = require("utils")
local utils = vim.g.utils
require("vim_g_opts")
require("autocmd")
require("lazy_config")
if not utils.is_machmotion() then
  return utils.set_colorscheme("duskfox")
else
  return utils.set_colorscheme("kanagawa")
end
