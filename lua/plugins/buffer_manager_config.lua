local BufferManagerConfig = {
  'j-morano/buffer_manager.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = { -- curently just defaults
    line_keys = '1234567890',
    select_menu_item_commands = {
      edit = {
        key = '<CR>',
        command = 'edit',
      },
    },
    focus_alternate_buffer = false,
    width = nil,
    height = nil,
    short_file_names = false,
    show_depth = true,
    short_term_names = false,
    loop_nav = true,
    highlight = '',
    win_extra_options = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    format_function = nil,
    order_buffers = nil,
    show_indicators = nil,
    toggle_key_bindings = { 'q', '<ESC>' },
  },
  keys = {
    {
      '<leader>ob',
      function()
        require('buffer_manager.ui').toggle_quick_menu()
      end,
      mode = 'n',
      desc = 'Open [b]uffer Manager',
    },
  },
}

return BufferManagerConfig
