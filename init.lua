vim.g.utils = require('utils.init')
local utils = vim.g.utils

-- Some keymaps require custom vim.g opts, so that's first
require('options')
require('commands')
require('autocmd')
require('keymaps')
-- Lazy calls defer.run('lazy'), which is used by keymaps->whichkey
require('lazy_config')

-- vim.g.utils.defer.run()

if not utils.is_machmotion() then
  utils.set_colorscheme('night-owl')
else
  utils.set_colorscheme('duskfox')
end
