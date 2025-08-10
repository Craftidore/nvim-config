-- [nfnl] init.fnl
local vim = _G.vim
vim.g["utils"] = require("utils")
local utils = vim.g.utils
require("vim-g-opts")
require("autocmd")
require("lazy-config")
if not utils.is_machmotion() then
  return utils.set_colorscheme("duskfox")
else
  return utils.set_colorscheme("kanagawa")
end
