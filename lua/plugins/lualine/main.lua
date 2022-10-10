if vim.g["started_by_firenvim"] then
    vim.cmd [[set showtabline=0]]
    vim.cmd [[set laststatus=0]]
else
    require('lualine').setup {}
end
