require('packerList').add({'neovim/nvim-lspconfig', config = function()
    local lspconfig = require('lspconfig');
    _G.Lsp_Defaults = lspconfig.util.default_config;
    Lsp_Defaults.capabilities = vim.tbl_deep_extend(
        'force',
        Lsp_Defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
    );

    lspconfig.sumneko_lua.setup({
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    });

    vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function ()
            local bufmap = function(mode, lhs, rhs)
                local opts = {buffer = true};
                vim.keymap.set(mode, lhs, rhs, opts);
            end

            bufmap('n', '<leader>s', '<cmd>lua vim.lsp.buf.hover()<CR>');
            bufmap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>');
            bufmap('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
            bufmap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
            bufmap('n', '<leader>go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
            bufmap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>')
            bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
            bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

            bufmap('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
            bufmap('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
            bufmap('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_next()<cr>')
        end

    });
end});
