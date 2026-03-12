-- [nfnl] lua/plugins/emoji-config.fnl
local vim = _G.vim
local function _1_(_, opts)
  require("emoji").setup(opts)
  local ts = require("telescope").load_extension("emoji")
  return vim.keymap.set("n", "<leader>tse", ts.emoji, {desc = "[T]elescope [S]earch [E]moji"})
end
return {"allaman/emoji.nvim", version = "1.0.0", ft = "markdown", dependencies = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim"}, opts = {enable_cmp_integration = true}, config = _1_, lazy = false}
