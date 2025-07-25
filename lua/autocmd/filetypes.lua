local api = vim.api
local utils = vim.g.utils

local group = 'crafti-filetype'

api.nvim_create_augroup(group, { clear = true })

api.nvim_create_autocmd({ 'LspAttach' }, {
  pattern = { '*.cpp', '*.hpp', '*.h', '*.c' },
  group = group,
  desc = 'Default-disable C++ LSP if in MachMotion env',
  callback = function()
    if utils.is_machmotion() then
      vim.cmd([[LspStop]])
      vim.notify('C++ Lsp disabled', vim.log.levels.INFO)
    end
  end,
})
