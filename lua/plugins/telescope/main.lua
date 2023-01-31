
require('packerList').add({
    'nvim-telescope/telescope.nvim', tag = '0.1.0', -- fuzzy file finder
    requires = { {'nvim-lua/plenary.nvim'} }, -- pre-defined functions that other things depend on
    config = function ()
        local api = vim.api
        local opts = { noremap = true }
        api.nvim_set_keymap("n", "<leader>ff", [[<cmd>Telescope find_files<cr>]], opts)
        api.nvim_set_keymap("n", "<leader>fg", [[<cmd>Telescope live_grep<cr>]], opts)
        api.nvim_set_keymap("n", "<leader>fb", [[<cmd>Telescope buffers<cr>]], opts)
        api.nvim_set_keymap("n", "<leader>fh", [[<cmd>Telescope help_tags<cr>]], opts)
    end
})

