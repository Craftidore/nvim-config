local o = vim.o
local opt = vim.opt
local utils = vim.g.utils

-- uses utils.g.text_width
opt.formatoptions:append({ 't' }) -- Autowrap at text-width at end-of-line
opt.formatoptions:remove({ 'l' }) -- If disabled, autowrap even if you're adding to a line that's already >textwidth
opt.formatoptions:remove({ 'r' }) -- Add * to multi-line comments after <CR>
opt.formatoptions:remove({ 'o' }) -- Add * to multi-line comments after o/O
