require('packerList').add({'wbthomason/packer.nvim'})
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    require('packerList').forEach(use);
end)

