(local oil-config
  { 1 :stevearc/oil.nvim
    :keys [{ 1 "<leader>o."
             2 "<cmd>Oil .<cr>"
             :mode :n
             :desc "Open Oil in current directory"}]
  :opts {}
  ; Optional dependencies
  ; dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  :dependencies [:nvim-tree/nvim-web-devicons] ; use if you prefer nvim-web-devicons
  ; Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  :lazy false})

oil-config
