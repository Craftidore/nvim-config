-- [nfnl] lua/treesitter/treesitter-config.fnl
local utils = _G.vim.g.utils
local treesitter_config
local function _1_(lazy_opts)
  require("nvim-treesitter").setup(lazy_opts.opts)
  return utils.defer.run("nvim-treesitter")
end
treesitter_config = {"nvim-treesitter/nvim-treesitter", keys = {{"<leader>ot", "<CMD>TSContext<CR>", mode = "n", desc = "Open [t]reesitter Info"}}, branch = "main", build = ":TSUpdate", opts = {}, config = _1_, lazy = false}
local function _2_()
  local auto_install = {"bash", "c", "cpp", "diff", "lua", "luadoc", "markdown", "markdown_inline", "query", "vim", "vimdoc", "xml", "json", "javascript", "janet_simple", "css", "svelte"}
  return require("nvim-treesitter").install(auto_install):wait(300000)
end
utils.defer.add_deferred(_2_, "nvim-treesitter")
return treesitter_config
