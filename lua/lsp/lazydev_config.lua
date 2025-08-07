-- [nfnl] lua/lsp/lazydev_config.fnl
local vim = _G.vim
return {"folke/lazydev.nvim", ft = "lua", opts = {library = {{path = "${3rd}/luv/library", words = {"vim%.uv"}}}}}
