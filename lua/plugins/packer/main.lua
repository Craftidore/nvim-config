require('packerList').add({'wbthomason/packer.nvim'})
vim.cmd [[packadd packer.nvim]]
local use = require("packer").use

return require('packer').startup(function()
    require('packerList').forEach(use);
end)

