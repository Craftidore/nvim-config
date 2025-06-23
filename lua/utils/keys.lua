local Keys = {}
Keys.escape_keys = function(keys)
  return vim.api.nvim_replace_termcodes(keys, true, false, true)
end
Keys.escape = Keys.escape_keys('<Esc>')
Keys.cr = Keys.escape_keys('<CR>')
return Keys
