require('options')
require('lazy_config')
require('keymaps')

local utils = require('utils')

utils.defer.run()

if not utils.is_machmotion() then
  utils.set_colorscheme('duskfox')
else
  utils.set_colorscheme('night-owl')
end
