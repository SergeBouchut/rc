" Plugin vundle.vim
set nocompatible
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'python-mode/python-mode'
Plugin 'davidhalter/jedi-vim'
call vundle#end()

" Plugin python-mode
let g:pymode_lint = 1 
let g:pymode_lint_checker = "pyflakes,pep8,pylint"
let g:pymode_lint_config = "$HOME/.pylintrc"
let g:pymode_options_max_line_length = 100 
let g:pymode_lint_on_write = 1 
let g:pymode_virtualenv = 1 
let g:pymode_rope = 0 " disable auto completion

" Plugin jedi-vim
let g:jedi#popup_on_dot = 0 " disable auto completion
let g:jedi#show_call_signatures = 2 

" Indent
filetype plugin indent on
set expandtab
set autoindent
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType php setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2

" Other
set list listchars=trail:.,extends:+
set ignorecase smartcase
set number
set foldlevel=99
set modelines=0
