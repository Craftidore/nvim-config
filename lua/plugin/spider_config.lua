local defaultModes = { 'n', 'o', 'x' }
local function spiderMotion(key)
  return [[<cmd>lua require('spider').motion(']] .. key .. [[')<CR>]]
end

local SpiderConfig = {
  'chrisgrieser/nvim-spider',
  keys = {
    { '<leader>w', spiderMotion('w'), mode = defaultModes },
    { '<leader>e', spiderMotion('e'), mode = defaultModes },
    { '<leader>b', spiderMotion('b'), mode = defaultModes },
  },
  -- opts = {
  --   skipInsignificantPunctuation = true,
  --   consistentOperatorPending = true,
  --   subwordMovement = true,
  --   customPatterns = {},
  -- },
}

return SpiderConfig
