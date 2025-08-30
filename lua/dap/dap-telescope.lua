-- [nfnl] lua/dap/dap-telescope.fnl
local vim = _G.vim
local function _1_()
  return require("telescope").load_extension("dap")
end
return {"nvim-telescope/telescope-dap.nvim", dependencies = {"nvim-telescope/telescope.nvim"}, config = _1_}
