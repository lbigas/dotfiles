call plug#begin('~/.vim/plugged')
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/Yggdroot/indentLine.git'
Plug 'https://github.com/Valloric/YouCompleteMe.git'
Plug 'https://github.com/flazz/vim-colorschemes.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/Raimondi/delimitMate.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
"Plug 'https://github.com/vim-airline/vim-airline-themes.git'
call plug#end()
set statusline+=%F
set t_Co=256
set background=dark
scriptencoding utf-8
let mapleader=","
colorscheme gruvbox 
"set background=dark
syntax enable " enalbe syntax processing
set tabstop=4 " number of visual spaces er TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
set shiftwidth=4
set number " show line numbers
set relativenumber " show relative line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set cursorcolumn " highlight current column
set nocompatible " make vim not vi
set wildmenu " visual autocomplete for comand menu
set lazyredraw " redraw only when we need to
set showmatch " highlight matching brackets
set incsearch " search as characters are entered
set hlsearch " highlight matches
set ignorecase " ignore case when searching
set ls=2 " display filename statusbar
set mat=2 " blink for 2 sec
set title " show title in console title bar
set noerrorbells " disable error sound bell
set novisualbell " disable error visual bell
" movement
nnoremap <c-k> 5k
nnoremap <c-j> 5j
" line warping
set wrap
set formatoptions=1
set lbr
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" vim tabs
nnoremap tn :tabnew<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap H ^
nnoremap L $
" more sensible w key
nnoremap w W
" keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv
" nove between matching opening and ending cide; { code}
map <tab> %
" save sudo
map <leader>sudo :w !sudo tee % <CR><CR>
" vim indent guides
let g:indentline_char = '¦'
"let g:indentline_color_term = 239
"let g:indentline_color_dark = 2
let g:indentline_leadingspacechar = '-'
"let g:indentline_leadingspaceenabled = 1
"let g:indentline_enabled = 1
" delimitMate
let delimitMate_expand_cr = 1

map - <nop>

" NERDTree
nnoremap <leader>nt :NERDTreeToggle<CR>
