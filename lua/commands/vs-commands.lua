local api = vim.api

api.nvim_create_user_command(
  'VSToQuickfix',
  [[
    "Converts MSVC compiler output to a vim-compatible quickfix list
      " Erase all that aren't warnings or errors
    v/error\|warning/d
      " Don't care about warning as error messages just the warnings
    g/error C2220/d
      " Swap path sep
    %s;\\;/;ge
      " Vim Quickfix likes fname:lnum:cnum:error
    %s/(/:/e
      " Use : for column data
    %s/,\(\d\+\))/:\1/e
    %s;^\d\+>Z:;/var/home/craftidore/HomeDir/MachMotion/mach;e
      " Best-guess attempt at replacing for linker errors. Assumes pwd is root of errors
    %s;^\d\+>\(.*\)\.obj : \(.*LNK\);\=substitute(execute('pwd'), '\n', '', '') .. '/' .. submatch(1) .. ".cpp:0:" .. submatch(2);e
      " If any lines didn't have a path, they were a mistake Ex: Powershell errors
    g/^\d>/d
      " Remove ^Ms
    %s///ge
  ]],
  {}
)
