-- [nfnl] lua/plugins/buffer_manager_config.fnl
local buffer_manager_config
local function _1_()
  return require("buffer_manager.ui").toggle_quick_menu()
end
buffer_manager_config = {"j-morano/buffer_manager.nvim", dependencies = {"nvim-lua/plenary.nvim"}, opts = {line_keys = "1234567890", select_menu_item_commands = {edit = {key = "<CR>", command = "edit"}}, width = nil, height = nil, show_depth = true, loop_nav = true, highlight = "", win_extra_options = {}, borderchars = {"\226\148\128", "\226\148\130", "\226\148\128", "\226\148\130", "\226\149\173", "\226\149\174", "\226\149\175", "\226\149\176"}, format_function = nil, order_buffers = nil, show_indicators = nil, toggle_key_bindings = {"q", "<ESC>"}, focus_alternate_buffer = false, short_file_names = false, short_term_names = false}, keys = {{"<leader>ob", _1_, mode = "n", desc = "Open [b]uffer Manager"}}}
return buffer_manager_config
