require('packerList').add({
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},                         -- Required
        {'williamboman/mason.nvim'},                     -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},                 -- Required
        {'hrsh7th/cmp-nvim-lsp'},         -- Required
        {'hrsh7th/cmp-buffer'},             -- Optional
        {'hrsh7th/cmp-path'},                 -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'},         -- Optional

        -- Snippets
        {'L3MON4D3/LuaSnip'},                         -- Required
        {'rafamadriz/friendly-snippets'}, -- Optional
    },
    config = function()
        vim.opt.signcolumn = 'yes';

        -- Learn the keybindings, see :help lsp-zero-keybindings
        -- Learn to configure LSP servers, see :help lsp-zero-api-showcase
        local lsp = require('lsp-zero');
        local cmp = require("cmp");
        local select_opts = {select = false};
        lsp.preset('recommended');


        lsp.set_preferences({
            set_lsp_keymaps = false,
        });

        lsp.on_attach(function (client, bufnr)
            local opts = { buffer = bufnr, remap = false};
            vim.keymap.set("n", "<leader>s", function () vim.lsp.buf.hover() end, opts);
            vim.keymap.set("n", "<leader>gd", function () vim.lsp.buf.definition() end, opts);
            vim.keymap.set("n", "<leader>gD", function () vim.lsp.buf.declaration() end, opts);
            vim.keymap.set("n", "<leader>gi", function () vim.lsp.buf.implementation() end, opts);
            vim.keymap.set("n", "<leader>go", function () vim.lsp.buf.type_definition() end, opts);
            vim.keymap.set("n", "<leader>gr", function () vim.lsp.buf.references() end, opts);
            vim.keymap.set("n", "<C-k>", function () vim.lsp.buf.signature_help() end, opts);
            vim.keymap.set("n", "<F2>", function () vim.lsp.buf.signature_help() end, opts); -- I want to change this
            vim.keymap.set("n", "<leader>gl", function () vim.diagnostic.open_float() end, opts);
            vim.keymap.set("n", "<leader>gn", function () vim.diagnostic.goto_prev() end, opts);
            vim.keymap.set("n", "<leader>gp", function () vim.diagnostic.goto_next() end, opts);
        end);

        lsp.setup_nvim_cmp({
            sources = {
                { name = 'path' },
                { name = 'nvim_lsp', keyword_length = 3 },
                { name = 'buffer', keyword_length = 3 },
                { name = 'luasnip', keyword_length = 2 },
            },
            mapping = lsp.defaults.cmp_mappings({
                -- completion
                ['<CR>'] = cmp.mapping.confirm(select_opts),
                ['<UP>'] = cmp.mapping.select_prev_item(select_opts),
                ['<DOWN>'] = cmp.mapping.select_next_item(select_opts),
                ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
                ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),

                -- scroll docs window
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),

                -- cancel completion
                ['<C-e>'] = cmp.mapping.abort(),

                -- next placeholder
                ['<C-j>'] = cmp.mapping(function(fallback)
                    local luasnip = require('luasnip');
                    if luasnip.jumpable(1) then
                        luasnip.jump(1);
                    else
                        fallback();
                    end
                end, {'i', 's'}),
                ['<Tab>'] = vim.NIL,
                ['<S-Tab>'] = vim.NIL,
            }),
        });

        -- (Optional) Configure lua language server for neovim
        lsp.nvim_workspace();

        lsp.setup();
    end

});
