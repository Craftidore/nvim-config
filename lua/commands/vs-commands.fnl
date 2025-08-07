(local api _G.vim.api)

(api.nvim_create_user_command
  :VSToQuickfix
  (.. "\"Converts MSVC compiler output to a vim-compatible quickfix list\n"
      ; Erase all that aren't warnings or errors
      "v/error\\|warning/d\n"
      ; Don't care about warning as error messages just the warnings
      "g/error C2220/d\n"
      ; Swap path sep
      "%s;\\\\;/;ge\n"
      ; Vim Quickfix likes fname:lnum:cnum:error
      "%s/(/:/e\n"
      ; Use : for column data
      "%s/,\\(\\d\\+\\))/:\\1/e\n"
      "%s;^\\d\\+>Z:;/var/home/craftidore/HomeDir/MachMotion/mach;e\n"
      ; Best-guess attempt at replacing for linker errors. Assumes pwd is root of errors
      "%s;^\\d\\+>\\(.*\\)\\.obj : \\(.*LNK\\);\\=substitute(execute('pwd'), '\\n', '', '') .. '/' .. submatch(1) .. \".cpp:0:\" .. submatch(2);e\n"
      ; If any lines didn't have a path, they were a mistake Ex: Powershell errors
      "g/^\\d>/d\n"
      ; Remove ^Ms
      "%s///ge\n")
  {})

