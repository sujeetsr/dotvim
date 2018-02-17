set nocompatible " Various plugins need this
set laststatus=2   " Always show the statusline (for powerline)
set encoding=utf-8 " Necessary to show unicode glyphs (for powerline)
set gfn=Monaco:h12
set lazyredraw
set expandtab
set showmatch
set showmode
set nobackup
set nowritebackup
let mapleader = ","
set directory=/Users/ssreenivasan/.vimbackup
set ruler
set incsearch
set nohlsearch
set number
set guioptions-=T
set guioptions-=r
set noerrorbells 
set novisualbell
set t_vb=
set clipboard=unnamed "system clipbioard

autocmd! GUIEnter * set vb t_vb=

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path (vim.org tip #2)
if has("unix")
    map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
else
    map ,e :e <C-R>=expand("%:p:h") . "\" <CR>
endif

" NERDTree plugin (file explorer)
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" SVG
au BufRead,BufNewFile *.svg setf xml

" turn completion on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType cucumber setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType jst setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xhtml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType txt setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType java setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType groovy setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html.handlebars setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType handlebars setlocal shiftwidth=2 tabstop=2 softtabstop=2

"""""""""""""""""""""""""""
""" Plugins with vim-plug
"""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

""""""""""""
" Navigation
""""""""""""
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

""""""""""""
" Git
""""""""""""
Plug 'tpope/vim-fugitive'

""""""""""""
" Syntax
""""""""""""
Plug 'yalesov/vim-emblem'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'kchmck/vim-coffee-script'
" Plug 'vim-syntastic/syntastic'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'https://github.com/adelarsq/vim-matchit' 

""""""""""""
" Editing
""""""""""""
Plug 'w0rp/ale'
Plug 'junegunn/vim-easy-align'
" " Plug 'Valloric/YouCompleteMe'
" 
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'wokalski/autocomplete-flow'
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'ervandew/supertab'

" Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
""""""""""""
" Colors
""""""""""""
Plug 'brendonrapp/smyck-vim'
Plug 'fcpg/vim-fahrenheit'

call plug#end()

syntax on
filetype plugin indent on

""" Plugin settings

" deoplete
let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1

" let g:deoplete#omni#functions = {}
" let g:deoplete#omni#functions.javascript = [
"   \ 'tern#Complete',
" \]
" set completeopt=longest,menuone,preview
" let g:deoplete#sources = {}
" let g:deoplete#sources['javascript.jsx'] = ['ternjs']
" let g:tern#command = ['tern']
" let g:tern#arguments = ['--persistent']

" ack.vim - use ag for searching
let g:ackprg = 'ag --vimgrep --smart-case'                                                   
cnoreabbrev ag Ack                                                                           
cnoreabbrev aG Ack                                                                           
cnoreabbrev Ag Ack                                                                           
cnoreabbrev AG Ack  

" FZF
nnoremap <leader>; :Buffers<CR>
nnoremap <leader>t :Files<CR>

" vim-easy-align
vmap <Enter> <Plug>(EasyAlign)

" Syntastic 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
let g:syntastic_javascript_eslint_exe = 'eslint_d'
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '⚠️'
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" vim-task mapping
autocmd FileType task noremap <Leader>x :call Toggle_task_status()<CR>

" Custom Mappings
map <leader>u :cd /Users/ssreenivasan/code/netflix/moneyball2-ui<CR>
" make navigation between splits easier (instead of ctrl-w then j, its just
" ctrl-j)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

colorscheme fahrenheit
" JSX in JS
set background=dark

" Cursor color
