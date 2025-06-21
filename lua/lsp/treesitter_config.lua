local utils = vim.g.utils
local noremap = utils.keymaps.noremap
local TreesitterConfig = {

  -- Other plugins
  -- - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  -- - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  -- - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects

  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  keys = {
    { '<leader>ot', '<CMD>TSInstallInfo<CR>', mode = 'n', desc = 'Open Treesitter Info' },
  },
}

return TreesitterConfig
