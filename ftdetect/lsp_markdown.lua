-- Normal 'markdown' filetype doesn't highlight `code` right
vim.filetype.add({
  extension = {
    -- NOTE: Seems like the default priority for user filetype is lower than 'markdown'
    ['md'] = 'lsp_markdown',
  },
})
