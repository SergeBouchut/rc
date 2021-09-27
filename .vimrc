set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" python
Plugin 'python-mode/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'ambv/black'
" go
Plugin 'fatih/vim-go'
call vundle#end()

" ##### git

set diffopt+=vertical

" ##### python

let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8,pylint"
let g:pymode_lint_config = "$HOME/.pylintrc"
let g:pymode_options_max_line_length = 100
let g:pymode_lint_on_write = 1
let g:pymode_virtualenv = 1
let g:pymode_rope = 0 " disable auto completion
let g:jedi#popup_on_dot = 0 " disable auto completion
let g:jedi#show_call_signatures = 2
" auto format at save
" autocmd BufWritePre *.py execute ':Black'

" ##### go

" syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
" auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
" status line types/signatures
let g:go_auto_type_info = 1
" auto build at save
autocmd BufWritePre *.go execute ':GoBuild'

" #### global

filetype plugin indent on

set modelines=0
set expandtab
set autoindent

set list listchars=tab:▸\ ,trail:•

set ignorecase smartcase incsearch hlsearch

set number cursorline

set foldlevel=1

set wildchar=<Tab> wildmenu wildmode=full

" window split
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
autocmd FileType go setlocal listchars+=tab:\ \  tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType go inoremap <buffer> <C-Space> <C-x><C-p>

" visual mode indentation
vnoremap < <gv
vnoremap > >gv

" normal mode move
nnoremap <up> gk
nnoremap <down> gj
nnoremap <left> h
nnoremap <right> l

" normal mode selection
nnoremap <S-W> viw
nnoremap <S-X> vi(
nnoremap <S-Q> vi'
nnoremap <S-S> vi"

set shell=/bin/zsh
