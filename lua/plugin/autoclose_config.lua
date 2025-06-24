local AutocloseConfig = {
  'm4xshen/autoclose.nvim',
  opts = {
    keys = {
      ['$'] = { escape = true, close = true, pair = '$$', enabled_filetypes = { 'tex', 'markdown' } },
      ['>'] = { escape = true, close = true, pair = '<>', enabled_filetypes = { 'html', 'xml' } },
    },
    options = {
      disable_filetypes = { 'text' },
      disable_when_touch = true,
      touch_regex = '[%w(%[{]',
      pair_spaces = false,
      auto_indent = true,
      disable_command_mode = true,
    },
  },
}

return AutocloseConfig
