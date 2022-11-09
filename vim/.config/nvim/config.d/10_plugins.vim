set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-tsserver']

Plug 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>

Plug 'godlygeek/tabular'

Plug 'vyperlang/vim-vyper'

Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

" Linting for JS
" Plug 'mxw/vim-jsx'
" let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" let g:syntastic_javascript_checkers = ['eslint']

" airline {{{
" reset status bar quickly
if !has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		autocmd InsertEnter * set timeoutlen=0
		autocmd InsertLeave * set timeoutlen=1000
	augroup END
endif

set noshowmode			" hide the default mode text ( -- INSERT -- )
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#enabled=0
let g:airline_powerline_fonts=1
"let g:airline_theme='base16'
let g:airline_theme='bubblegum'
" }}}

function! Installjshint(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g jshint
  endif
endfunction

" All of your Plugins must be added before the following line
call plug#end()            " required

