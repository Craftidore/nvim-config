local augrpid = vim.api.nvim_create_augroup('crafti.ftdetect', { clear = false })
vim.api.nvim_create_autocmd({
  'BufRead',
  'BufNewFile',
}, {
  group = augrpid,
  pattern = { '*.tmp', '*.temp', 'tmp', 'temp' },
  callback = function(info)
    -- Doesn't set the filetype if it was already set
    vim.cmd([[setfiletype tmp]])
  end,
})
