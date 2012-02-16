set nocompatible
set gfn=DejaVu\ Sans\ Mono:h12
set expandtab
set showmatch
set showmode
set nobackup
set nowritebackup
compiler ruby
let mapleader = ","
set directory=/Users/sujeet/.vimbackup
set ruler
set incsearch
set nohlsearch
set number

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path (vim.org tip #2)
if has("unix")
    map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
else
    map ,e :e <C-R>=expand("%:p:h") . "\" <CR>
endif

" NERDTree plugin (file explorer)
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" turn completion on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType jst setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Ruby completion options
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

call pathogen#infect()
syntax on
filetype plugin indent on
colorscheme eclm_wombat

