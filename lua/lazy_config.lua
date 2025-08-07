-- [nfnl] lua/lazy_config.fnl
local vim = _G.vim
local utils = vim.g.utils
local noremap = utils.keymaps.noremap
local lazypath = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
  if (vim.v.shell_error ~= 0) then
    error(("Error cloning lazy.nvim:\n" .. out))
  else
  end
else
end
local rtp = vim.opt.rtp
rtp:prepend(lazypath)
local lazyUiConfig
local _3_
if vim.g.have_nerd_font then
  _3_ = {}
else
  _3_ = {cmd = "\226\140\152", config = "\240\159\155\160", event = "\240\159\147\133", ft = "\240\159\147\130", init = "\226\154\153", keys = "\240\159\151\157", plugin = "\240\159\148\140", runtime = "\240\159\146\187", require = "\240\159\140\153", source = "\240\159\147\132", start = "\240\159\154\128", task = "\240\159\147\140", lazy = "\240\159\146\164 "}
end
lazyUiConfig = {icons = _3_}
require("lazy").setup({spec = {{import = "themes"}, {import = "plugins"}, {import = "lsp"}, {import = "treesitter"}}, ui = lazyUiConfig})
noremap("n", "<leader>ol", "<CMD>Lazy<CR>", "Open [l]azy")
return utils.defer.run("lazy")
