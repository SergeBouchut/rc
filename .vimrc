set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'python-mode/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'ambv/black'
call vundle#end()

let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8,pylint"
let g:pymode_lint_config = "$HOME/.pylintrc"
let g:pymode_options_max_line_length = 100
let g:pymode_lint_on_write = 1
let g:pymode_virtualenv = 1
let g:pymode_rope = 0 " disable auto completion
let g:jedi#popup_on_dot = 0 " disable auto completion
let g:jedi#show_call_signatures = 2

autocmd BufWritePre *.py execute ':Black'

filetype plugin indent on

set modelines=0
set expandtab
set autoindent

set list
set listchars=trail:.

set ignorecase smartcase incsearch hlsearch

set number cursorline

set foldlevel=1

set wildchar=<Tab> wildmenu wildmode=full

set splitright splitbelow

command! E :Explore
command! S :Sexplore
command! V :Vexplore!

autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType sh setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType xml setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType htmldjango setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2

vnoremap < <gv
vnoremap > >gv

nnoremap <up> gk
nnoremap <down> gj
nnoremap <left> h
nnoremap <right> l

nnoremap <S-W> viw
nnoremap <S-X> vi(
nnoremap <S-Q> vi'
nnoremap <S-S> vi"

set shell=/bin/zsh
