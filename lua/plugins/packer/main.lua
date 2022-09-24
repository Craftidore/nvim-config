vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {'neoclide/coc.nvim', branch='release'}
  use {'bkad/CamelCaseMotion'}
  use {'tpope/vim-commentary'}
  use {'nvim-treesitter/nvim-treesitter'}
  --use {'rcarriga/nvim-notify'}
  --use {'nvim-lualine/lualine.nvim'}
  -- use {''}
end)
