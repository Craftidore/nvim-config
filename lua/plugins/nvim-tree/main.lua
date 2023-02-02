require('packerList').add({'kyazdani42/nvim-tree.lua',
    tag = 'nightly',
    config = function ()
        local nvimtree = require "nvim-tree"

        -- empty setup using defaults
        if not vim.g["started_by_firenvim"] then
            nvimtree.setup()
    end

end})

