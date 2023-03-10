require('packerList').add({
    'nvim-telescope/telescope.nvim', tag = '0.1.0', -- fuzzy file finder
    requires = { {'nvim-lua/plenary.nvim'} }, -- pre-defined functions that other things depend on
    config = function ()
        local api = vim.api
        local opts = { noremap = true }
        -- space-space-t for default Telescope search
        api.nvim_set_keymap("n", "<leader><leader>t", [[<cmd>Telescope<cr>]], opts)
        api.nvim_set_keymap("n", "<leader>tt", [[<cmd>Telescope treesitter<cr>]], opts)
        api.nvim_set_keymap("n", "<leader>tf", [[<cmd>Telescope find_files<cr>]], opts)
        api.nvim_set_keymap("n", "<leader>tg", [[<cmd>Telescope live_grep<cr>]], opts)
        api.nvim_set_keymap("n", "<leader>tb", [[<cmd>Telescope buffers<cr>]], opts)
        api.nvim_set_keymap("n", "<leader>th", [[<cmd>Telescope help_tags<cr>]], opts)
        api.nvim_set_keymap("n", "<leader>tn", [[<cmd>Telescope find_files cwd=~/.config/nvim/<cr>]], opts)
        api.nvim_set_keymap("n", "<leader>tk", [[<cmd>Telescope keymaps<cr>]], opts)
        api.nvim_set_keymap("n", "<leader>gf", [[<cmd>Telescope git_files<cr>]], opts)
        api.nvim_set_keymap("n", "<leader>gb", [[<cmd>Telescope git_branches<cr>]], opts)
        api.nvim_set_keymap("n", "<leader>lr", [[<cmd>Telescope lsp_references<cr>]], opts)
        api.nvim_set_keymap("n", "<leader>ls", [[<cmd>Telescope lsp_document_symbols<cr>]], opts)
        api.nvim_set_keymap("n", "<leader>le", [[<cmd>Telescope diagnostic<cr>]], opts) -- lsp_errors
        -- api.nvim_set_keymap("n", "<leader>tc", [[<cmd>Telescope command_history<cr>]], opts)
    end
})

