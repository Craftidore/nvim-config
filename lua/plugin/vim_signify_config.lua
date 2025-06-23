local utils = vim.g.utils

local SvnGutter = {
  'mhinz/vim-signify',
  event = 'VeryLazy',
  enabled = utils.is_machmotion,
  config = function()
    vim.o.updatetime = 100
  end,
}

return SvnGutter
