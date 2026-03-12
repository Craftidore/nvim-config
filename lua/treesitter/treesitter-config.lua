-- [nfnl] lua/treesitter/treesitter-config.fnl
local utils = _G.vim.g.utils
local treesitter_config
local function _1_(lazy_opts)
  require("nvim-treesitter").setup(lazy_opts.opts)
  return utils.defer.run("nvim-treesitter")
end
treesitter_config = {"nvim-treesitter/nvim-treesitter", keys = {{"<leader>ot", "<CMD>TSContext<CR>", mode = "n", desc = "Open [t]reesitter Info"}}, version = "0.10.0", build = ":TSUpdate", opts = {}, config = _1_, lazy = false}
return treesitter_config
