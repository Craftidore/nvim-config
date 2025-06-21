require('options')
require('lazy_config')
require('keymaps')

require('utils').defer.run()

pcall(vim.cmd, [[colorscheme duskfox]])
