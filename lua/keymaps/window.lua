local utils = vim.g.utils
local Keymaps = utils.keymaps

-- NOTE: Window

-- Tmux "Zoom"-y equivalent
Keymaps.noremap('n', '<C-w>t', '<cmd>tab split<CR>', '[W]indow: Zoom in on current buffer (opens [t]ab)')
-- alias, for muscle memory
Keymaps.noremap('n', '<C-w>z', '<cmd>tab split<CR>', '[W]indow: [z]oom in on current buffer (opens tab)')
