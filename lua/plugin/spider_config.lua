local utils = vim.g.utils
local SpiderConfig = {
  'chrisgrieser/nvim-spider',
}
SpiderConfig.lastSpider = 'w'

local defaultModes = { 'n', 'o', 'x' }
local function spiderMotion(key)
  return [[<cmd>lua ]]
    .. [[require('plugin.spider_config').lastSpider = ]]
    .. key
    .. '; '
    .. [[require('spider').motion(']]
    .. key
    .. [[')]]
    .. [[<CR>]]
end
local function doLastSpider()
  return spiderMotion(SpiderConfig.lastSpider)
end

SpiderConfig.keys = {
  { '<leader>sw', spiderMotion('w'), mode = defaultModes, desc = '[S]pider: CamelCase [w]' },
  { '<leader>se', spiderMotion('e'), mode = defaultModes, desc = '[S]pider: CamelCase [e]' },
  { '<leader>sb', spiderMotion('b'), mode = defaultModes, desc = '[S]pider: CamelCase [b]' },
  { '<leader>sn', doLastSpider(), mode = defaultModes, desc = '[S]pider: Repeat last spider command' },
}

utils.defer.add_deferred(function()
  if utils.has_plugin('spider') then
    utils.keymaps.wk_add({
      { '<leader>s', group = '[S]pider Motions' },
    })
  end
end, 'lazy')

return SpiderConfig
