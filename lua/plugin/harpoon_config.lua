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
    makeCmd('<leader>hh', harpoonAdd, 'Add to harpoon list'),
    makeCmd('<leader>ha', harpoonAdd, 'Add to harpoon list'),
    makeCmd('<leader>hs', harpoonShowList, 'Show harpoon list'),
    makeCmd('<leader>hj', function()
      harpoonGoTo(1)
    end, 'Harpoon GoTo 1'),
    makeCmd('<leader>hk', function()
      harpoonGoTo(2)
    end, 'Harpoon GoTo 2'),
    makeCmd('<leader>hl', function()
      harpoonGoTo(3)
    end, 'Harpoon GoTo 3'),
    makeCmd('<leader>hn', harpoonNext, 'Harpoon next'),
    makeCmd('<leader>hp', harpoonPrev, 'Harpoon prev'),
    makeCmd('<leader>ha', [[<CMD>b#<CR>]], 'Harpoon: Swap-to-previous-buffer (technically not a harpoon thing)'),
  },
}

return Harpoon
