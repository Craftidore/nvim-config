-- [nfnl] lua/plugins/which_key_config.fnl
local vim = _G.vim
local g = vim.g
local utils = g.utils
local _1_
if g.have_nerd_font then
  _1_ = {}
else
  _1_ = {Up = "<Up> ", Down = "<Down> ", Left = "<Left> ", Right = "<Right> ", C = "<C-\226\128\166> ", M = "<M-\226\128\166> ", D = "<D-\226\128\166> ", S = "<S-\226\128\166> ", CR = "<CR> ", Esc = "<Esc> ", ScrollWheelDown = "<ScrollWheelDown> ", ScrollWheelUp = "<ScrollWheelUp> ", NL = "<NL> ", BS = "<BS> ", Space = "<Space> ", Tab = "<Tab> ", F1 = "<F1>", F2 = "<F2>", F3 = "<F3>", F4 = "<F4>", F5 = "<F5>", F6 = "<F6>", F7 = "<F7>", F8 = "<F8>", F9 = "<F9>", F10 = "<F10>", F11 = "<F11>", F12 = "<F12>"}
end
local function _3_(opts)
  require("which-key").setup(opts.opts)
  return utils.defer.run("which-key")
end
return {"folke/which-key.nvim", event = "VeryLazy", opts = {preset = "helix", delay = 0, icons = {mappings = g.have_nerd_font, keys = _1_}, triggers = {{"<auto>", mode = "nixsotc"}, {"<C-x>", mode = "nixsotc"}}, plugins = {marks = true, registers = true, spelling = {enabled = true, suggestions = 10}, presets = {text_objects = true, windows = true, nav = true, z = true, g = true, motions = false, operators = false}}, spec = {{"ZZ", mode = "n", desc = "Save and Quit (:wq)"}, {"<C-x><C-l>", mode = "i", desc = "Complete whole [l]ines"}, {"<C-x><C-n>", mode = "i", desc = "Complete [n] keywords in current file"}, {"<C-x><C-k>", mode = "i", desc = "Complete [k] words from a dictionary"}, {"<C-x><C-t>", mode = "i", desc = "Complete words from a [t]hesaurus"}, {"<C-x><C-i>", mode = "i", desc = "Complete current and [i]ncluded files"}, {"<C-x><C-]>", mode = "i", desc = "Complete tags []]"}, {"<C-x><C-f>", mode = "i", desc = "Complete [f]ile names"}, {"<C-x><C-d>", mode = "i", desc = "Complete [d]efinitions or macro (also in included files)"}, {"<C-x><C-v>", mode = "i", desc = "Complete [v]im command line"}, {"<C-x><C-u>", mode = "i", desc = "Complete [u]ser defined completion"}, {"<C-x><C-o>", mode = "i", desc = "Complete [o]mni (intelligent) completion"}, {"<C-x><C-z>", mode = "i", desc = "Complete nothing; cancel"}}, win = {wo = {winblend = g.winblend}}}, config = _3_}
