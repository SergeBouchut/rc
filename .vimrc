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
