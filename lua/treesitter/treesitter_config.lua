local utils = vim.g.utils
local TreesitterConfig = {
  -- Other plugins
  -- - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  -- - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  -- - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects

  'nvim-treesitter/nvim-treesitter',
  keys = {
    { '<leader>ot', '<CMD>TSContext<CR>', mode = 'n', desc = 'Open [t]reesitter Info' },
  },
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  opts = {
    -- install_dir = vim.fn.stdpath('data') .. '/site/',
  },
  config = function(lazy_opts)
    require('nvim-treesitter').setup(lazy_opts.opts)
    utils.defer.run('nvim-treesitter')
  end,
}

utils.defer.add_deferred(function()
  local auto_install = {
    'bash',
    'c',
    'diff',
    'lua',
    'luadoc',
    'markdown',
    'markdown_inline',
    'query',
    'vim',
    'vimdoc',
  }
  require('nvim-treesitter').install(auto_install):wait(300000) -- max. 5 minutes
end, 'nvim-treesitter')

return TreesitterConfig
