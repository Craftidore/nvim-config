require('packerList').add({
    'kana/vim-textobj-user',-- lets other textobj plugins work 
    requires =  {
        {'rbonvall/vim-textobj-latex'},
        {'michaeljsmith/vim-indent-object'}, -- for python-y languages
        {'tkhren/vim-textobj-numeral'}, -- for numbers
    }
})
