vim.cmd [[packadd packer.nvim]]
local use = require("packer").use

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use "lewis6991/impatient.nvim"

    -- Theming
    use {'sainnhe/sonokai'} -- Beautiful sonokai theme

    -- Quality of Life
    use {'bkad/CamelCaseMotion'} -- <leader>w, <leader>b, <leader>e, etc.
    use {'tpope/vim-commentary'} -- gc now comments things out
    use {'nvim-lualine/lualine.nvim', -- Status bar on the bottom
        requires= {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {'ggandor/leap.nvim'} -- sal jumps to next al instance; better than f
    use {'tpope/vim-repeat'} -- lets plugin-derived motions repeat
    --use {'rcarriga/nvim-notify'}

    -- QoL textobj plugins
    use {'kana/vim-textobj-user'} -- lets other textobj plugins work
    use {'rbonvall/vim-textobj-latex'}
    use {'michaeljsmith/vim-indent-object'} -- for python-y languages
    use {'tkhren/vim-textobj-numeral'} -- for numbers

    -- File explorer
    use {'kyazdani42/nvim-tree.lua', tag = 'nightly'}
    use {'kyazdani42/nvim-web-devicons'} -- devicons for nvim-tree
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0', -- fuzzy file finder
        requires = { {'nvim-lua/plenary.nvim'} } -- pre-defined functions that other things depend on
    }

    -- Completion
    use {'williamboman/mason.nvim'}
    use {'neovim/nvim-lspconfig'}
    use {'williamboman/mason-lspconfig.nvim',
    requires = {'neovim/nvim-lspconfig', 'williamboman/mason.nvim'}}
    use {"hrsh7th/nvim-cmp", requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "folke/neodev.nvim",
    }}
    use {'ray-x/lsp_signature.nvim'}
    use {'lvimuser/lsp-inlayhints.nvim'}

    use {'gelguy/wilder.nvim'} -- Ex-Mode autocompletion
    use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"} --  syntax highlighting
    --use {'machakann/vim-sandwich'} -- conflicts with ggandor/leap.nvim, and I didn't figure out how to rebind either of them.
    use {'vim-latex/vim-latex', tag = 'v1.10.0'}

    -- Other
    use {'glacambre/firenvim'} -- nvim in the browser
    use "chrisgrieser/nvim-genghis"
    use {'stevearc/dressing.nvim'}
    use {'rcarriga/nvim-notify'}
    use {'kshenoy/vim-signature'}
    use {'nanozuki/tabby.nvim'}
end)
