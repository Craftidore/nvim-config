vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {'neoclide/coc.nvim', branch='release'}
    use {'bkad/CamelCaseMotion'}
    use {'tpope/vim-commentary'}
    use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"} --  syntax highlighting
    --use {'rcarriga/nvim-notify'}
    use {'nvim-lualine/lualine.nvim', 
        requires= {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {'kyazdani42/nvim-tree.lua', tag = 'nightly'}
    use {'kyazdani42/nvim-web-devicons'} -- devicons for nvim-tree
    use {'ggandor/leap.nvim'}
    use {'sainnhe/sonokai'}
    use {'gelguy/wilder.nvim'}
    --use {'machakann/vim-sandwich'} -- conflicts with ggandor/leap.nvim, and I didn't figure out how to rebind either of them.
    use {'tpope/vim-repeat'}
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'vim-latex/vim-latex', tag = 'v1.10.0'}
end)
