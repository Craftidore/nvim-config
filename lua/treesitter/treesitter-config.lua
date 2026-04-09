-- [nfnl] lua/treesitter/treesitter-config.fnl
local utils = _G.vim.g.utils
local treesitter_config
local function _1_(lazy_opts)
  require("nvim-treesitter").setup(lazy_opts.opts)
  return utils.defer.run("nvim-treesitter")
end
treesitter_config = {"nvim-treesitter/nvim-treesitter", keys = {{"<leader>ot", "<CMD>TSContext<CR>", mode = "n", desc = "Open [t]reesitter Info"}}, commit = "6620ae1c44dfa8623b22d0cbf873a9e8d073b849", build = ":TSUpdate", branch = "main", opts = {}, config = _1_, lazy = false}
return treesitter_config
