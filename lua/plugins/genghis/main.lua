require('packerList').add({'chrisgrieser/nvim-genghis', config = function ()
    local genghis = require "genghis"

    local keymap = vim.keymap.set
    -- NOTE: All starting with 'e' because genghis is inspired by __e__unuch
    --       https://github.com/chrisgrieser/nvim-genghis#how-is-this-different-from-vimeunuch
    keymap("n", "<leader>eyp", genghis.copyFilepath)
    keymap("n", "<leader>eyn", genghis.copyFilename)
    keymap("n", "<leader>eyy", genghis.duplicateFile)
    keymap("n", "<leader>ecx", genghis.chmodx)
    keymap("n", "<leader>err", genghis.renameFile)
    keymap("n", "<leader>en", genghis.createNewFile)
    keymap("n", "<leader>ed", genghis.trashFile) -- requires macOS or Linux `mv` command
    keymap("x", "<leader>x", genghis.moveSelectionToNewFile)
end})

