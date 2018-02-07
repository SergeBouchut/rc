set number

set ignorecase
" set incsearch

" Text remained selected after indent
vnoremap < <gv
vnoremap > >gv

" Selection shortcuts
nnoremap W viw
nnoremap E vi'
nnoremap R vi(

" Completion with space
inoremap <C-@> <C-P>

command! E :Explore
command! S :Sexplore
command! V :Vexplore

" Quit the terminal
tnoremap <Esc> <C-\><C-n>
