local TelescopeConfig = {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },

  config = function()
    require('telescope').setup({
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    })

    local themes = require('telescope.themes')
    local dropdown = themes.get_dropdown
    local get_cursor = themes.get_cursor

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    function default_theme(additional_opts)
      local opts = {
        winblend = 30,
      }
      if additional_opts ~= nil then
        for k, v in pairs(additional_opts) do
          opts[k] = v
        end
      end
      return opts
    end
    function buf_theme(additional_opts)
      local opts = {
        winblend = 30,
        previewer = false,
      }
      if additional_opts ~= nil then
        for k, v in pairs(additional_opts) do
          opts[k] = v
        end
      end
      return dropdown(opts)
    end
    function file_theme(additional_opts)
      local opts = {
        winblend = 30,
        previewer = true,
      }
      if additional_opts ~= nil then
        for k, v in pairs(additional_opts) do
          opts[k] = v
        end
      end
      return dropdown(opts)
    end

    function themed(picker, theme, theme_opts)
      if theme == nil then
        return function()
          return picker(default_theme(theme_opts))
        end
      end
      return function()
        return picker(theme(theme_opts))
      end
    end

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>th', themed(builtin.help_tags, buf_theme), { desc = '[T]elescope search [H]elp' })
    vim.keymap.set('n', '<leader>tk', themed(builtin.keymaps, default_theme), { desc = '[T]elescope search [K]eymaps' })
    vim.keymap.set('n', '<leader>tf', themed(builtin.find_files, file_theme), { desc = '[T]elescope search [F]iles' })
    vim.keymap.set(
      'n',
      '<leader>tt',
      themed(builtin.builtin, file_theme),
      { desc = '[T]elescope search select [T]elescope' }
    )
    vim.keymap.set(
      'n',
      '<leader>tc',
      themed(builtin.colorscheme, file_theme),
      { desc = '[T]elescope search [C]olorscheme' }
    )
    vim.keymap.set(
      'n',
      '<leader>tw',
      themed(builtin.grep_string, buf_theme),
      { desc = '[T]elescope search current [W]ord' }
    )
    vim.keymap.set('n', '<leader>tg', themed(builtin.live_grep, buf_theme), { desc = '[T]elescope search by [G]rep' })
    vim.keymap.set(
      'n',
      '<leader>td',
      themed(builtin.diagnostics, file_theme),
      { desc = '[T]elescope search [D]iagnostics' }
    )
    vim.keymap.set('n', '<leader>tr', builtin.resume, { desc = '[T]elescope search [R]esume' })
    vim.keymap.set(
      'n',
      '<leader>t.',
      themed(builtin.oldfiles, file_theme),
      { desc = '[T]elescope search Recent Files ("." for repeat)' }
    )
    vim.keymap.set(
      'n',
      '<leader>tb',
      themed(builtin.buffers, default_theme),
      { desc = 'Telescope search existing [B]uffers' }
    )
    vim.keymap.set(
      'n',
      '<leader>/',
      themed(builtin.current_buffer_fuzzy_find, buf_theme),
      { desc = '[/] Fuzzily search in current buffer' }
    )
    vim.keymap.set(
      'n',
      '<leader>t/',
      themed(builtin.live_grep, default_theme, {
        grep_open_files = true,
        prompt_title = 'Live Grep',
      }),
      { desc = '[T]elescope search [/] open files' }
    )
    vim.keymap.set(
      'n',
      '<leader>tn',
      themed(builtin.find_files, file_theme, {
        cwd = vim.fn.stdpath('config'),
      }),
      { desc = '[T]elescope search [N]eovim config' }
    )
  end,
}

return TelescopeConfig
