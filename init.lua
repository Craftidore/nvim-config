vim.g.utils = require('utils.init')
local utils = vim.g.utils

require('options')
-- Some keymaps require custom vim.g opts
require('keymaps')
-- Lazy calls defer.run('lazy'), which is used by keymaps->whichkey
require('lazy_config')

-- vim.g.utils.defer.run()

if not utils.is_machmotion() then
  utils.set_colorscheme('duskfox')
else
  utils.set_colorscheme('night-owl')
end
