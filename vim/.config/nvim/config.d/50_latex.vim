" LaTeX settings
function SetLatexOptions()
    set tabstop=2
    set formatoptions-=t
    set softtabstop=2
   	set expandtab
   	set shiftwidth=2
    set spell spelllang=en_us
    set tw=79
    " SyntasticToggleMode
endfunction
au BufNewFile,BufRead *.tex call SetLatexOptions()

