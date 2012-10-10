set nocompatible " Various plugins need this
set laststatus=2   " Always show the statusline (for powerline)
set encoding=utf-8 " Necessary to show unicode glyphs (for powerline)
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

" RABL
" treat .rabl files as .rb
au BufRead,BufNewFile *.rabl setf ruby
" highlight rabl dsl methods
au BufRead,BufNewFile *.rabl syn keyword rubyRabl node attribute object child collection attributes glue extends
au BufRead,BufNewFile *.rabl hi def link rubyRabl Function

" SVG
au BufRead,BufNewFile *.svg setf xml

" turn completion on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType cucumber setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType jst setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Ruby completion options
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

call pathogen#infect()
syntax on
filetype plugin indent on
"colorscheme eclm_wombat
colorscheme smyck

