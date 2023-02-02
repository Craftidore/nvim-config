require('packerList').add({'wbthomason/packer.nvim'})
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    require('packerList').forEach(use);
end)

