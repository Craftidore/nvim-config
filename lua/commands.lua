local api = vim.api

api.nvim_create_user_command(
  'VSToQuickfix',
  [[
      " Erase all that aren't warnings or errors
    v/error\|warning/d
      " Don't care about warning as error messages just the warnings
    g/error C2220/d
      " Swap path sep
    %s;\\;/;g
      " Vim Quickfix likes fname:lnum:error
    %s/(/:/
      " Vim Quickfix doesn't like the column data
    %s/,\d\+)//
    %s;^\d\+>Z:;/var/home/craftidore/HomeDir/MachMotion/mach;
      " If any lines didn't have a path, they were a mistake Ex: Powershell errors
    g/^\d>/d
  ]],
  {}
)
