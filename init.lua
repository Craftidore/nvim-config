vim.g.utils = require('utils')
local utils = vim.g.utils

-- Some keymaps require custom vim.g opts, so that's first
require('vim_g_opts')
-- Some autocmds react to Lazy/colorscheme things
require('autocmd')

-- Lazy calls defer.run('lazy'), which is used by keymaps->whichkey
require('lazy_config')

if not utils.is_machmotion() then
  utils.set_colorscheme('duskfox')
else
  utils.set_colorscheme('night-owl')
end
