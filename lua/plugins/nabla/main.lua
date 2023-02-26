require("packerList").add({
    "jbyuki/nabla.nvim",
    config = {
        function ()
            Keymaps = require('keybinds.utils');
            Keymaps.noremap("n", "<leader>gt", [[:lua require("nabla").popup()<CR>]]);
        end
    }
})
