
set number cursorline

set tabstop=4 softtabstop=4 shiftwidth=4
set modelines=0
set expandtab
set autoindent

" Search options (incremental = live)
set ignorecase smartcase incsearch hlsearch

" Display trailing space
set listchars=trail:.

" Text remained selected after indent
vnoremap < <gv
vnoremap > >gv

" Move inside wrapped lines by default
nnoremap <up> gk
nnoremap <down> gj
nnoremap <left> h
nnoremap <right> l

" Selection shortcuts

" Completion with space
inoremap <C-space> <C-P>

" Split on the right / below by default
set splitright splitbelow

" Shortcuts to explore
command! E :Explore
command! S :Sexplore
command! V :Vexplore!

" Auto switch in insert mode
autocmd BufEnter term://* sbp startinsert
" Quit the insert mode
tnoremap <Esc> <C-\><C-n>
command! T vsplit | terminal

" Smart selection

function! SelectInner(tag)
    " We have to switch to normal mode to compare positions
    execute "normal! vi".a:tag."\<C-\>\<C-n>"
    return getpos("'<") != getpos("'>")
endfunction

function! TrySelectInner(tags)
    for tag in a:tags
        if SelectInner(tag)
            normal! gv
            break
        endif
    endfor
endfunction

nnoremap W viw
nnoremap E :call TrySelectInner(["'", '"'])<CR>
nnoremap R :call TrySelectInner(['(', '[', '{'])<CR>
