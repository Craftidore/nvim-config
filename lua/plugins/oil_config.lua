local Oil = {
  'stevearc/oil.nvim',
  keys = {
    { '<leader>o.', '<cmd>Oil .<cr>', mode = 'n', desc = 'Open Oil in current directory' },
  },
  opts = {},
  -- Optional dependencies
  -- dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}

return Oil
