local utils = vim.g.utils
local function makeCmd(key, func, desc)
  return {
    key,
    func,
    mode = 'n',
    desc = desc,
  }
end

local function harpoonAdd()
  local harpoon = require('harpoon')
  harpoon:list():add()
end

local function harpoonShowList()
  local harpoon = require('harpoon')
  harpoon.ui:toggle_quick_menu(harpoon:list())
end

local function harpoonGoTo(num)
  local harpoon = require('harpoon')
  harpoon:list():select(num)
end

local function harpoonNext()
  local harpoon = require('harpoon')
  harpoon:list():next()
end

local function harpoonPrev()
  local harpoon = require('harpoon')
  harpoon:list():prev()
end

local Harpoon = {
  'ThePrimeagen/harpoon',
  opts = {},
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    makeCmd('<leader>hh', harpoonAdd, 'Harpoon: Add to list'),
    makeCmd('<leader>ho', harpoonShowList, 'Harpoon: Show list'),
    makeCmd('<leader>ha', function()
      harpoonGoTo(1)
    end, 'Harpoon: GoTo 1'),
    makeCmd('<leader>hs', function()
      harpoonGoTo(2)
    end, 'Harpoon: GoTo 2'),
    makeCmd('<leader>hd', function()
      harpoonGoTo(3)
    end, 'Harpoon: GoTo 3'),
    makeCmd('<leader>hf', function()
      harpoonGoTo(4)
    end, 'Harpoon: GoTo 4'),
    makeCmd('<leader>hg', function()
      harpoonGoTo(5)
    end, 'Harpoon: GoTo 5'),
    makeCmd('<leader>hn', harpoonNext, 'Harpoon: Next'),
    makeCmd('<leader>hp', harpoonPrev, 'Harpoon: Prev'),
    -- I'm debating removing this one, since I ought to be in the habit of using CTRL-^
    makeCmd('<leader>hl', [[<CMD>b#<CR>]], 'Harpoon: Swap-to-previous-buffer (not harpoon)'),
  },
}

utils.defer.add_deferred(function()
  if utils.plugins.has_plugin('harpoon') then
    utils.keymaps.wk_add({
      { '<leader>h', group = '[H]arpoon' },
    })
  end
end, 'which-key')

return Harpoon
