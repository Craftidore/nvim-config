require('packerList').add({'vim-latex/vim-latex', tag = 'v1.10.0', config = function ()
    vim.cmd[["
    let g:Tex_BibtexFlavor = 'biber'
    let g:Tex_DefaultTargetFormat = 'pdf'
    let g:Tex_MultipleCompileFormats = 'pdf,dvi'
    let g:Tex_CompileRule_bib = 'biber $*'
    ]]

    vim.cmd[["
    nmap <Leader>lb :exec '!biber '.Tex_GetMainFileName(':p:t:r').'.bcf'<CR>
    ]]
end})


