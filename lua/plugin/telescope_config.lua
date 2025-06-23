local utils = vim.g.utils
local noremap = utils.keymaps.noremap
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
    {
      'albenisolmos/telescope-oil.nvim',
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
        ['oil'] = {
          -- Otherwise it includes .git folders
          hidden = false,
          debug = false,
          no_ignore = false,
          show_preview = true,
        },
      },
    })

    local themes = require('telescope.themes')
    local dropdown = themes.get_dropdown
    local get_cursor = themes.get_cursor

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    local function oil_directories()
      require('telescope').extensions.oil.oil()
    end

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
    noremap('n', '<leader>th', themed(builtin.help_tags, buf_theme), 'Telescope search [H]elp')
    noremap('n', '<leader>tk', themed(builtin.keymaps, default_theme), 'Telescope search [K]eymaps')
    noremap('n', '<leader>tf', themed(builtin.find_files, file_theme), 'Telescope search [F]iles')
    noremap('n', '<leader>to', oil_directories, 'Telescope open dir in [o]il')
    noremap('n', '<leader>tt', themed(builtin.builtin, file_theme), 'Telescope search select [t]elescope')

    noremap('n', '<leader>tc', function()
      vim.cmd([[colorscheme default]])
      themed(builtin.colorscheme, file_theme, { enable_preview = true, ignore_builtins = true })()
    end, 'Telescope search [C]olorscheme')

    noremap('n', '<leader>tw', themed(builtin.grep_string, buf_theme), 'Telescope search current [W]ord')

    noremap('n', '<leader>tg', themed(builtin.live_grep, buf_theme), 'Telescope search by [G]rep')
    noremap('n', '<leader>td', themed(builtin.diagnostics, file_theme), 'Telescope search [D]iagnostics')

    noremap('n', '<leader>tr', builtin.resume, 'Telescope search [R]esume')
    noremap('n', '<leader>t.', themed(builtin.oldfiles, file_theme), 'Telescope search Recent Files ("." for repeat)')

    noremap('n', '<leader>tb', themed(builtin.buffers, default_theme), 'Telescope search existing [B]uffers')

    noremap(
      'n',
      '<leader>t/',
      themed(builtin.current_buffer_fuzzy_find, buf_theme),
      'Telescope Fuzzily search [/] in current buffer'
    )

    -- noremap( 'n', '<leader>tg/', themed(builtin.live_grep, default_theme, { grep_open_files = true, prompt_title = 'Live Grep', }), 'Telescope search [/] open files')
    --
    noremap(
      'n',
      '<leader>tn',
      themed(builtin.find_files, file_theme, { cwd = vim.fn.stdpath('config') }),
      'Telescope search [N]eovim config'
    )
  end,
}

utils.defer.add_deferred(function()
  if utils.plugins.has_plugin('telescope') then
    utils.keymaps.wk_add({
      { '<leader>t', group = '[T]elescope' },
    })
  end
end, 'which-key')

return TelescopeConfig
