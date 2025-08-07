-- [nfnl] lua/keymaps/buffer.fnl
local utils = _G.vim.g.utils
local Keymaps = utils.keymaps
Keymaps.noremap("n", "<leader>bn", "<cmd>bnext<CR>", "Next buffer")
Keymaps.noremap("n", "<leader>bN", "<cmd>bprev<CR>", "Previous buffer")
Keymaps.noremap("n", "<leader>bb", "<cmd>buffers<cr>:b<space>", "Open buffer picker")
Keymaps.noremap("n", "<leader>bq", "<cmd>bd<cr>", "Close buffer")
Keymaps.noremap("n", "<leader>bd", "<cmd>bd<cr>", "Close buffer")
Keymaps.noremap("n", "<leader>bo", "<cmd>%bd|e#|bd#<cr>|`\"", "Close all buffers except current")
local function _1_()
  return utils.keymaps.wk_add({{"<leader>b", group = "[B]uffer"}})
end
utils.defer.add_deferred(_1_, "which-key")
return nil
