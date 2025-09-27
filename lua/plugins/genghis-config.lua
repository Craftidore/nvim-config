-- [nfnl] lua/plugins/genghis-config.fnl
local function _1_(lazy_opts)
  local genghis = require("genghis")
  return genghis.setup(lazy_opts.opts)
end
return {"chrisgrieser/nvim-genghis", opts = {fileOperations = {autoAddExt = true}, navigation = {ignoreDotfiles = true, ignoreExt = {"png", "svg", "webp", "jpg", "jpeg", "gif", "pdf", "zip"}, ignoreFilesWithName = {".DS_Store"}, onlySameExtAsCurrentFile = false}, successNotifications = true, icons = {chmodx = "\243\176\146\131", copyFile = "\243\177\137\165", copyPath = "\243\176\133\141", duplicate = "\238\171\176", file = "\243\176\136\148", move = "\243\176\170\185", new = "\243\176\157\146", nextFile = "\243\176\150\189", prevFile = "\243\176\150\191", rename = "\243\176\145\149", trash = "\243\176\169\185"}}, config = _1_, keys = {{"<leader>ufn", "<CMD>Genghis copyFilename<CR>", desc = "Copies Filename", mode = "n"}, {"<leader>ufp", "<CMD>Genghis copyFilepath<CR>", desc = "Copies Filepath", mode = "n"}, {"<leader>ufx", "<CMD>Genghis chmodx<CR>", desc = "chmod +x current file", mode = "n"}, {"<leader>ufr", "<CMD>Genghis renameFile<CR>", desc = "Rename current file", mode = "n"}}}
