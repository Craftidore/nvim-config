-- [nfnl] lua/plugins/telescope-config.fnl
local vim = _G.vim
local utils = vim.g.utils
local g = vim.g
local noremap = utils.keymaps.noremap
local telescope_config
local function _1_()
  return (vim.fn.executable("make") == 1)
end
local function _2_()
  require("telescope").setup({extensions = {"ui-select", {require("telescope.themes").get_dropdown()}, "oil", {show_preview = true, debug = false, hidden = false, no_ignore = false}}})
  local themes = require("telescope.themes")
  local dropdown = themes.get_dropdown
  local get_cursor = themes.get_cursor
  pcall(require("telescope").load_extension, "fzf")
  pcall(require("telescope").load_extension, "ui-select")
  local function oil_directories()
    return require("telescope").extensions.oil.oil()
  end
  local function default_theme(additional_opts)
    local opts = {winblend = g.winblend}
    if (additional_opts ~= nil) then
      for k, v in pairs(additional_opts) do
        opts[k] = v
      end
    else
    end
    return opts
  end
  local function buf_theme(additional_opts)
    local opts = {winblend = g.winblend, previewer = false}
    if (additional_opts ~= nil) then
      for k, v in pairs(additional_opts) do
        opts[k] = v
      end
    else
    end
    return dropdown(opts)
  end
  local function file_theme(additional_opts)
    local opts = {winblend = vim.g.winblend, previewer = true}
    if (additional_opts ~= nil) then
      for k, v in pairs(additional_opts) do
        opts[k] = v
      end
    else
    end
    return dropdown(opts)
  end
  local function themed(picker, theme, theme_opts)
    if (theme == nil) then
      local function _6_()
        return picker(default_theme(theme_opts))
      end
      return _6_
    else
      local function _7_()
        return picker(theme(theme_opts))
      end
      return _7_
    end
  end
  local builtin = require("telescope.builtin")
  noremap("n", "<leader>th", themed(builtin.help_tags, buf_theme), "Telescope search [H]elp")
  noremap("n", "<leader>tk", themed(builtin.keymaps, default_theme), "Telescope search [K]eymaps")
  noremap("n", "<leader>tf", themed(builtin.find_files, file_theme), "Telescope search [F]iles")
  noremap("n", "<leader>to", oil_directories, "Telescope open dir in [o]il")
  noremap("n", "<leader>tt", themed(builtin.builtin, file_theme), "Telescope search select [t]elescope")
  local function _9_()
    return themed(builtin.colorscheme, file_theme, {enable_preview = true, ignore_builtins = true})()
  end
  noremap("n", "<leader>tc", _9_, "Telescope search [c]olorscheme")
  noremap("n", "<leader>te", themed(builtin.commands, file_theme, {}), "Telescope [e]xecute Command")
  noremap("n", "<leader>tw", themed(builtin.grep_string, file_theme, {enable_preview = true}), "Telescope search current [W]ord")
  noremap("n", "<leader>tg", themed(builtin.live_grep, buf_theme, {enable_preview = true}), "Telescope search by [G]rep")
  noremap("n", "<leader>td", themed(builtin.diagnostics, file_theme), "Telescope search [D]iagnostics")
  noremap("n", "<leader>tr", builtin.resume, "Telescope search [R]esume")
  noremap("n", "<leader>t.", themed(builtin.oldfiles, file_theme), "Telescope search Recent Files (\".\" for repeat)")
  noremap("n", "<leader>tb", themed(builtin.buffers, default_theme), "Telescope search existing [B]uffers")
  noremap("n", "<leader>t/", themed(builtin.current_buffer_fuzzy_find, buf_theme), "Telescope Fuzzily search [/] in current buffer")
  return noremap("n", "<leader>tn", themed(builtin.find_files, file_theme, {cwd = vim.fn.stdpath("config")}), "Telescope search [N]eovim config")
end
telescope_config = {"nvim-telescope/telescope.nvim", event = "VimEnter", dependencies = {"nvim-lua/plenary.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = _1_}, {"albenisolmos/telescope-oil.nvim"}, {"nvim-telescope/telescope-ui-select.nvim"}, {"nvim-tree/nvim-web-devicons", enabled = g.have_nerd_font}}, config = _2_}
local function _10_()
  if utils.plugins.has_plugin("telescope") then
    return utils.keymaps.wk_add({{"<leader>t", group = "[T]elescope"}})
  else
    return nil
  end
end
utils.defer.add_deferred(_10_, "which-key")
return telescope_config
