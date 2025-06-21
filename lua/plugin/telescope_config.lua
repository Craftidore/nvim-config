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

    local function default_theme(additional_opts)
      local opts = {
        winblend = vim.g.winblend,
      }
      if additional_opts ~= nil then
        for k, v in pairs(additional_opts) do
          opts[k] = v
        end
      end
      return opts
    end
    local function buf_theme(additional_opts)
      local opts = {
        winblend = vim.g.winblend,
        previewer = false,
      }
      if additional_opts ~= nil then
        for k, v in pairs(additional_opts) do
          opts[k] = v
        end
      end
      return dropdown(opts)
    end
    local function file_theme(additional_opts)
      local opts = {
        winblend = vim.g.winblend,
        previewer = true,
      }
      if additional_opts ~= nil then
        for k, v in pairs(additional_opts) do
          opts[k] = v
        end
      end
      return dropdown(opts)
    end

    local function themed(picker, theme, theme_opts)
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
    vim.keymap.set('n', '<leader>th', themed(builtin.help_tags, buf_theme), { desc = 'Telescope search [H]elp' })
    vim.keymap.set('n', '<leader>tk', themed(builtin.keymaps, default_theme), { desc = 'Telescope search [K]eymaps' })
    vim.keymap.set('n', '<leader>tf', themed(builtin.find_files, file_theme), { desc = 'Telescope search [F]iles' })
    vim.keymap.set(
      'n',
      '<leader>tt',
      themed(builtin.builtin, file_theme),
      { desc = 'Telescope search select [t]elescope' }
    )
    vim.keymap.set('n', '<leader>tc', function()
      vim.cmd([[colorscheme default]])
      themed(builtin.colorscheme, file_theme, { enable_preview = true, ignore_builtins = true })()
    end, { desc = 'Telescope search [C]olorscheme' })
    vim.keymap.set(
      'n',
      '<leader>tw',
      themed(builtin.grep_string, buf_theme),
      { desc = 'Telescope search current [W]ord' }
    )
    vim.keymap.set('n', '<leader>tg', themed(builtin.live_grep, buf_theme), { desc = 'Telescope search by [G]rep' })
    vim.keymap.set(
      'n',
      '<leader>td',
      themed(builtin.diagnostics, file_theme),
      { desc = 'Telescope search [D]iagnostics' }
    )
    vim.keymap.set('n', '<leader>tr', builtin.resume, { desc = 'Telescope search [R]esume' })
    vim.keymap.set(
      'n',
      '<leader>t.',
      themed(builtin.oldfiles, file_theme),
      { desc = 'Telescope search Recent Files ("." for repeat)' }
    )
    vim.keymap.set(
      'n',
      '<leader>tb',
      themed(builtin.buffers, default_theme),
      { desc = 'Telescope search existing [B]uffers' }
    )
    vim.keymap.set(
      'n',
      '<leader>t/',
      themed(builtin.current_buffer_fuzzy_find, buf_theme),
      { desc = 'Telescope Fuzzily search [/] in current buffer' }
    )
    -- vim.keymap.set(
    --   'n',
    --   '<leader>tg/',
    --   themed(builtin.live_grep, default_theme, {
    --     grep_open_files = true,
    --     prompt_title = 'Live Grep',
    --   }),
    --   { desc = 'Telescope search [/] open files' }
    -- )
    vim.keymap.set(
      'n',
      '<leader>tn',
      themed(builtin.find_files, file_theme, {
        cwd = vim.fn.stdpath('config'),
      }),
      { desc = 'Telescope search [N]eovim config' }
    )
  end,
}

return TelescopeConfig
