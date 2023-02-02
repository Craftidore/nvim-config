require('packerList').add({'williamboman/mason-lspconfig.nvim', config = function()
    local masonlspconfig = require("mason-lspconfig");
    masonlspconfig.setup({
        ensure_installed = {
            'bashls',
            'clangd',
            'cmake',
            'cssmodules_ls',
            'eslint',
            'html',
            'intelephense',
            'jedi_language_server',
            'jsonls',
            'marksman',
            'sqlls',
            'sumneko_lua',
            'svelte',
            'taplo',
            'texlab',
            'tsserver',
            'yamlls',
        }
    })

    masonlspconfig.setup_handlers({
        function(server_name)
            require('lspconfig')[server_name].setup({
                on_attach = lsp_attack,
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
                -- on_attach = require("shared").on_attach,
            })
        end,
    })
end});
