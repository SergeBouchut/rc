set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'python-mode/python-mode'
Plugin 'davidhalter/jedi-vim'
" Plugin 'dracula/vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

set t_Co=256  " tmux seems to override $TERM which used by vim to enable 256 colors

" Plugin solarized
syntax enable
set background=dark
colorscheme solarized

" Plungin vim-airline
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_section_z='%l:%c'
" let g:airline_theme='aurora'

" Plugin python-mode
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8,pylint"
let g:pymode_lint_config = "$HOME/.pylintrc"
let g:pymode_options_max_line_length = 100
let g:pymode_lint_on_write = 1
let g:pymode_virtualenv = 1
let g:pymode_rope = 0 " disable auto completion

" Enable breakpoints plugin
" let g:pymode_breakpoint = 1
" let g:pymode_breakpoint_bind = '<leader>b'
" let g:pymode_breakpoint_cmd = 'import sys; import pdb; pdb.Pdb(stdout=sys.__stdout__).set_trace()  # XXX breakpoint a la cool'

" Plugin jedi-vim
let g:jedi#popup_on_dot = 0 " disable auto completion
let g:jedi#show_call_signatures = 2
let g:jedi#smart_auto_mappings = 0

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
autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType xml setlocal tabstop=2 softtabstop=2 shiftwidth=2

set shell=/bin/zsh

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

