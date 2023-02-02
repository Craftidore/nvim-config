require('packerList').add({'williamboman/mason.nvim', config = function() -- Status bar on the bottom
    local mason = require("mason")
    mason.setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    });
end});
