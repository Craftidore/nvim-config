local ghengis = require("ghengis")
local keymap = vim.keymap.set
keymap("n", "<leader>fyp", ghengis.copyFilepath)
keymap("n", "<leader>fyn", ghengis.copyFilename)
keymap("n", "<leader>fcx", ghengis.chmodx)
keymap("n", "<leader>frr", ghengis.renameFile)
keymap("n", "<leader>fnn", ghengis.createNewFile)
keymap("n", "<leader>fyy", ghengis.duplicateFile)
keymap("n", "<leader>fdd", ghengis.trashFile) -- requires macOS or Linux `mv` command
keymap("x", "<leader>x", ghengis.moveSelectionToNewFile)

