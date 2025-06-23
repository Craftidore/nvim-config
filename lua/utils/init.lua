local Utils = {}

Utils.echom = function(...)
  local msgs = {}
  for _, v in ipairs({ ... }) do
    table.insert(msgs, { v })
  end
  vim.api.nvim_echo(msgs, true, {})
end

Utils.keymaps = require('utils.keymaps')

Utils.lua = require('utils.lua')

Utils.set_colorscheme = function(colorscheme)
  -- NOTE: vim.cmd is a table which can be called as a function,
  -- which gives the LSP grief
  local function vim_cmd(arg)
    vim.cmd(arg)
  end
  xpcall(vim_cmd, function()
    vim_cmd('echom Failed to set colorscheme: ' .. tostring(colorscheme))
  end, 'colorscheme ' .. colorscheme)
end

Utils.keys = require('utils.keys')

Utils.visual = require('utils.visual')

Utils.is_machmotion = function()
  local MACHMOTION = vim.env['MACHMOTION']
  return MACHMOTION ~= nil and MACHMOTION ~= 'false'
end

Utils.plugins = require('utils.plugins')

Utils.defer = require('utils.defer')

Utils.marks = {}
Utils.marks.get_mark_row_col = function(mark)
  local cur_buf_id = vim.api.nvim_get_current_buf()
  return vim.api.nvim_buf_get_mark(cur_buf_id, mark)
end

Utils.scratch = require('utils.scratch')

return Utils
