require("mason-lspconfig").setup({
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

require('mason-lspconfig').setup_handlers({
    function(server_name)
        require('lspconfig')[server_name].setup({
            on_attach = lsp_attack,
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })
    end,
})
