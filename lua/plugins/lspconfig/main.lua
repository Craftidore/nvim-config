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

    -- ### START OF COPIED CONFIG ###
    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
      vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    end
end});
