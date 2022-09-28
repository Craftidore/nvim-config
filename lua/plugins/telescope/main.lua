local api = vim.api
local opts = { noremap = true }
local opts2 = { noremap = true, expr = true }


api.nvim_set_keymap("n", "<leader>ff", [[<cmd>Telescope find_files<cr>]], opts)
api.nvim_set_keymap("n", "<leader>fg", [[<cmd>Telescope live_grep<cr>]], opts)
api.nvim_set_keymap("n", "<leader>fb", [[<cmd>Telescope buffers<cr>]], opts)
api.nvim_set_keymap("n", "<leader>fh", [[<cmd>Telescope help_tags<cr>]], opts)
