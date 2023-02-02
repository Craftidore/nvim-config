require('packerList').add({'hrsh7th/nvim-cmp',
    requires = {'hrsh7th/cmp-nvim-lsp'},
    config = function()
    vim.opt.completeopt = {'menu','menuone','noselect'};

    local cmp = require('cmp');
    local luasnip = require('luasnip');
    local select_opts = {behavior = cmp.SelectBehavior.Select};

    cmp.setup({
        -- how to expand snippets
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
        },

        -- sources
        source = {
            { name = 'path' },
            { name = 'nvim_lsp', keyword_length = 3 },
            { name = 'buffer', keyword_length = 3 },
            { name = 'luasnip', keyword_length = 2 },
            -- { name = 'friendly-snippets', keyword_length = 2 },
        },

        -- what does the documentation window look like
        window = { 
            documentation = cmp.config.window.bordered()
        },

        -- how completion options are displayed
        formatting = {
            fields = {'menu', 'abbr', 'kind'},
            format = function(entry, item)
                local menu_icon = {
                    nvim_lsp = 'λ',
                    luasnip = '⋗',
                    buffer = 'Ω',
                    path = '🖫',
                };
                item.menu = menu_icon[entry.source.name];
                return item;
            end,
        },

        -- keybinds
        mapping = {
            -- completion
            ['<CR>'] = cmp.mapping.confirm({select = false}),
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
                if luasnip.jumpable(1) then
                    luasnip.jump(1);
                else
                    fallback();
                end
            end, {'i', 's'}),
        },
    });

    -- Floating window styling:
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
      vim.lsp.handlers.hover,
      {border = 'rounded'}
    )
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
      vim.lsp.handlers.signature_help,
      {border = 'rounded'}
    )

    -- Diagnostic symbols
    local sign = function(opts)
      vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
      })
    end

    sign({name = 'DiagnosticSignError', text = '✘'})
    sign({name = 'DiagnosticSignWarn', text = '▲'})
    sign({name = 'DiagnosticSignHint', text = '⚑'})
    sign({name = 'DiagnosticSignInfo', text = ''})

    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = false,
        float = {
            border = 'rounded',
            source = 'always',
            header = '',
            prefix = '',
        },
    });

    -- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    -- cmp.setup.cmdline({ '/', '?' }, {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = {
    --     { name = 'buffer' }
    --   }
    -- })

    -- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    -- cmp.setup.cmdline(':', {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = cmp.config.sources({
    --     { name = 'path' },
    --   }, {
    --     { name = 'cmdline' }
    --   })
end});
