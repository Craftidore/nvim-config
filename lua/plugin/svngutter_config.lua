local utils = require('utils')
if not utils.is_machmotion() then
  -- Returning nil yields 'true' when requiring
  return false
end

local SvnGutter = {
  'mhinz/vim-signify',
  event = 'VeryLazy',
  config = function()
    vim.o.updatetime = 100
  end,
}

return SvnGutter
