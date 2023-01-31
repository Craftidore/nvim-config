require('packerList').add({'chrisgrieser/nvim-genghis', config = function ()
    local genghis = require "genghis"

    local keymap = vim.keymap.set
    keymap("n", "<leader>fyp", genghis.copyFilepath)
    keymap("n", "<leader>fyn", genghis.copyFilename)
    keymap("n", "<leader>fcx", genghis.chmodx)
    keymap("n", "<leader>frr", genghis.renameFile)
    keymap("n", "<leader>fnn", genghis.createNewFile)
    keymap("n", "<leader>fyy", genghis.duplicateFile)
    keymap("n", "<leader>fdd", genghis.trashFile) -- requires macOS or Linux `mv` command
    keymap("x", "<leader>x", genghis.moveSelectionToNewFile)
end})

