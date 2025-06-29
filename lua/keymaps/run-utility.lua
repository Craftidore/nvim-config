local utils = vim.g.utils
local Keymaps = utils.keymaps

-- NOTE: Utility:

utils.defer.add_deferred(function()
  utils.keymaps.wk_add({
    { '<leader>u', group = 'Run [U]tility' },
  })
end, 'which-key')

Keymaps.noremap('n', '<leader>uu', '<NOP>', 'Util: Cancel util run without undo')
Keymaps.noremap('n', '<leader>uh', '<CMD>nohl<CR>', 'Util: Turn search [h]ighlighting off')
Keymaps.noremap('n', '<leader>ucl', 'mz?[a-z]<cr><cmd>nohl<cr>gul`z', '[U]til: Lowercase latest upper[c]ase [l]etter')

-- Better copy-all
Keymaps.noremap('n', '<leader>ua', 'mzggVG"+y`z', 'Util: Copy [a]ll of the buffer to clipboard')

-- Enable/Disable Textwidth (uses vim.g.text_width)
utils.defer.add_deferred(function()
  utils.keymaps.wk_add({
    { '<leader>uw', group = 'Manage opt_local.text[w]idth' },
  })
end, 'which-key')
Keymaps.noremap('n', '<leader>uwt', function()
  local current_text_width = vim.api.nvim_get_option_value('textwidth', { scope = 'local' })
  if current_text_width == 0 then
    vim.api.nvim_set_option_value('textwidth', vim.g.text_width, { scope = 'local' })
  else
    vim.api.nvim_set_option_value('textwidth', 0, { scope = 'local' })
  end
end, 'Toggle :set textwidth for current buffer')

Keymaps.noremap('n', '<leader>uwe', function()
  vim.api.nvim_set_option_value('textwidth', vim.g.text_width, { scope = 'local' })
end, 'Enable :set textwidth for current buffer')

Keymaps.noremap('n', '<leader>uwd', function()
  vim.api.nvim_set_option_value('textwidth', 0, { scope = 'local' })
end, 'Disable :set textwidth for current buffer')
