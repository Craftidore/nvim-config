require('packerList').add('wbthomason/packer.nvim')

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    require('packerList').forEach(use);
end)
    ---- Packer can manage itself
    --use {'bkad/CamelCaseMotion'} -- <leader>w, <leader>b, <leader>e, etc.
    --use {'neoclide/coc.nvim', branch='release'} -- Conquer of Completion (autocompletion)
    --use {'stevearc/dressing.nvim'}
    --use {'glacambre/firenvim'} -- nvim in the browser
    --use "chrisgrieser/nvim-genghis"
    --use {'ggandor/leap.nvim'} -- sal jumps to next al instance; better than f
    --use {'nvim-lualine/lualine.nvim', -- Status bar on the bottom
    --    requires= {'kyazdani42/nvim-web-devicons', opt = true}
    --}
    --use {'tpope/vim-repeat'} -- lets plugin-derived motions repeat
    ----use {'rcarriga/nvim-notify'}
    --use {'kyazdani42/nvim-tree.lua', tag = 'nightly'} 
    --use 'wbthomason/packer.nvim'
    ----use {'machakann/vim-sandwich'} -- conflicts with ggandor/leap.nvim, and I didn't figure out how to rebind either of them.
    --use {'sainnhe/sonokai'} -- Beautiful sonokai theme
    --use {'nanozuki/tabby.nvim'}
    --use {
    --    'nvim-telescope/telescope.nvim', tag = '0.1.0', -- fuzzy file finder
    --    requires = { {'nvim-lua/plenary.nvim'} } -- pre-defined functions that other things depend on
    --}
    --use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"} --  syntax highlighting
    --use {'gelguy/wilder.nvim'} -- Ex-Mode autocompletion
    --use {'lewis6991/impatient.nvim'}
    --use {'tpope/vim-commentary'} -- gc now comments things out
    --use {'kana/vim-textobj-user'} -- lets other textobj plugins work
    --use {'rbonvall/vim-textobj-latex'}
    --use {'michaeljsmith/vim-indent-object'} -- for python-y languages
    --use {'tkhren/vim-textobj-numeral'} -- for numbers
    --
    --

    ---- Theming

    ---- Quality of Life

    ---- QoL textobj plugins

    ---- File explorer
    --use {'kyazdani42/nvim-web-devicons'} -- devicons for nvim-tree

    ---- Completion


    --use {'rcarriga/nvim-notify'}
    --use {'kshenoy/vim-signature'}
