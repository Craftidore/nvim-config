local utils = vim.g.utils

local noremap = utils.keymaps.noremap

-- Much of this is adapted from kickstart.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

local lazyUiConfig = {
  -- If you are using a Nerd Font: set icons to an empty table which will use the
  -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
  icons = vim.g.have_nerd_font and {} or {
    cmd = '⌘',
    config = '🛠',
    event = '📅',
    ft = '📂',
    init = '⚙',
    keys = '🗝',
    plugin = '🔌',
    runtime = '💻',
    require = '🌙',
    source = '📄',
    start = '🚀',
    task = '📌',
    lazy = '💤 ',
  },
}

local lazyOpts = {
  -- Themes
  require('theme.night-owl'),
  require('theme.nightfox'),
  require('theme.sonokai'),

  -- Primary Plugins
  require('plugin.guess_indent_config'),

  require('plugin.gitsigns_config'),

  require('plugin.which_key_config'),

  require('plugin.spider_config'),

  require('plugin.various_textobjects_config'),

  require('plugin.buffer_manager_config'),

  -- Directory Navigation
  require('plugin.oil_config'),

  -- Undo Tree
  require('plugin.undotree_config'),

  -- Telescope
  require('plugin.telescope_config'),

  -- LSP
  require('lsp').lazydev,
  require('lsp').lspconfig,
  require('lsp').conform,
  require('lsp').blink,
  require('lsp').nvimlint,
  -- not quite lsp, but so close
  require('lsp').treesitter,

  -- Other
  require('plugin.todo_comments_config'),

  require('plugin.mini_config'),

  require('plugin.leap_config'),

  require('plugin.harpoon_config'),

  require('plugin.ripgrep_sub_config'),

  require('plugin.marks_config'), -- Currently only used for signcol marks, no mappings

  -- Disabled because issues inside of podman
  require('plugin.tmux_navigator_config'),
  -- Disabled because it doesn't support q:, q/ or q?
  require('plugin.noice_config'),

  -- MachMotion:
  require('plugin.vim_signify_config'),
}

lazyOpts.ui = lazyUiConfig

require('lazy').setup(lazyOpts)

noremap('n', '<leader>ol', '<CMD>Lazy<CR>')

utils.defer.run('lazy')
