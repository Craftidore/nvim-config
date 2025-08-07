-- [nfnl] lua/commands/vs-commands.fnl
local api = _G.vim.api
return api.nvim_create_user_command("VSToQuickfix", ("\"Converts MSVC compiler output to a vim-compatible quickfix list\n" .. "v/error\\|warning/d\n" .. "g/error C2220/d\n" .. "%s;\\\\;/;ge\n" .. "%s/(/:/e\n" .. "%s/,\\(\\d\\+\\))/:\\1/e\n" .. "%s;^\\d\\+>Z:;/var/home/craftidore/HomeDir/MachMotion/mach;e\n" .. "%s;^\\d\\+>\\(.*\\)\\.obj : \\(.*LNK\\);\\=substitute(execute('pwd'), '\\n', '', '') .. '/' .. submatch(1) .. \".cpp:0:\" .. submatch(2);e\n" .. "g/^\\d>/d\n" .. "%s/\r//ge\n"), {})
