require('packerList').add({'hrsh7th/nvim-cmp', config = function()
    vim.cmd[[set completeopt=menu,menuone,noselect]]

    local cmp = require'cmp'

    vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

    local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}

    local cmp_config = {
      completion = {
        completeopt = 'menu,menuone,noinsert'
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = {
        {name = 'path'},
        {name = 'nvim_lsp', keyword_length = 3},
        {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2},
      },
      window = {
        documentation = vim.tbl_deep_extend(
          'force',
          cmp.config.window.bordered(),
          {
            max_height = 15,
            max_width = 60,
          }
        )
      },
      formatting = {
        fields = {'abbr', 'menu', 'kind'},
        format = function(entry, item)
          local short_name = {
            nvim_lsp = 'LSP',
            nvim_lua = 'nvim'
          }

          local menu_name = short_name[entry.source.name] or entry.source.name

          item.menu = string.format('[%s]', menu_name)
          return item
        end,
      },
      mapping = {
        -- confirm selection
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<C-y>'] = cmp.mapping.confirm({select = false}),

        -- navigate items on the list
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

        -- scroll up and down in the completion documentation
        ['<C-f>'] = cmp.mapping.scroll_docs(5),
        ['<C-u>'] = cmp.mapping.scroll_docs(-5),

        -- toggle completion
        ['<C-e>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.close()
            fallback()
          else
            cmp.complete()
          end
        end),

        -- go to next placeholder in the snippet
        ['<C-d>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, {'i', 's'}),

        -- go to previous placeholder in the snippet
        ['<C-b>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {'i', 's'}),

        -- when menu is visible, navigate to next item
        -- when line is empty, insert a tab character
        -- else, activate completion
        ['<Tab>'] = cmp.mapping(function(fallback)
          local col = vim.fn.col('.') - 1

          if cmp.visible() then
            cmp.select_next_item(cmp_select_opts)
          elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            fallback()
          else
            cmp.complete()
          end
        end, {'i', 's'}),

        -- when menu is visible, navigate to previous item on list
        -- else, revert to default behavior
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item(cmp_select_opts)
          else
            fallback()
          end
        end, {'i', 's'}),
      }
    }

    cmp.setup(cmp_config)

    -- cmp.setup({
    --     snippet = {
    --         expand = function(args)
    --             require'luasnip'.lsp_expand(args.body)
    --         end
    --     },

    --     window = { },

    --     mapping  = cmp.mapping.preset.insert({
    --         ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    --         ['<C-f>'] = cmp.mapping.scroll_docs(4),
    --         ['<C-Space>'] = cmp.mapping.complete(),
    --         ['<C-e>'] = cmp.mapping.abort(),
    --         ['<CR>'] = cmp.mapping.confirm({ select = true }),
    --     }),

    --     sources = cmp.config.sources({
    --         { name = 'nvim-lsp', keyword_length = 3 },
    --         { name = 'buffer', keyword_length = 3 },
    --         { name = 'luasnip', keyword_length = 2 },
    --     }, {
    --         { name = 'buffer' },
    --     })
    -- })

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
    -- })

    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities = require('cmp_nvim_lsp').default_capabilities()
end});
