(local vim _G.vim)

{ 1 :nvim-telescope/telescope-dap.nvim
  :dependencies [:nvim-telescope/telescope.nvim]
  :config (fn [] ((. (require :telescope) :load_extension) :dap))}
