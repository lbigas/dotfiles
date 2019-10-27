"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/andbar-ru/vim-unicon.git'
" Plug 'plasticboy/vim-markdown'
Plug 'kaicataldo/material.vim'
Plug 'cormacrelf/vim-colors-github'
Plug 'https://github.com/reedes/vim-colors-pencil.git'
Plug 'https://github.com/morhetz/gruvbox.git'
" Plug 'https://github.com/junegunn/seoul256.vim.git'
Plug 'https://github.com/romainl/Apprentice.git'
Plug 'https://github.com/jonathanfilip/vim-lucius.git'
" Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'https://github.com/lambdalisue/suda.vim.git'
Plug 'NLKNguyen/papercolor-theme'
Plug 'https://github.com/rakr/vim-one.git'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
" Plug 'https://github.com/ludovicchabant/vim-gutentags.git'
Plug 'https://github.com/ervandew/supertab.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/farmergreg/vim-lastplace.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/junegunn/rainbow_parentheses.vim.git'
Plug 'https://github.com/mbbill/undotree.git'
Plug 'https://github.com/godlygeek/tabular.git'
call plug#end()

vmap <leader>y :w! /tmp/vitmp<CR>                                   
nmap <leader>p :r! cat /tmp/vitmp<CR>


" Clipboard with "+y 
set clipboard=unnamedplus

" Colors
set t_Co=256
set termguicolors
set background=light
" set background=dark
syntax enable " enalbe syntax processing
" colorscheme PaperColor
" colorscheme one
" colorscheme lucius
colorscheme unicon
" colorscheme onehalflight
" colorscheme onehalfdark
" colorscheme material
" colorscheme github
" colorscheme apprentice

set statusline=
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c

filetype plugin indent on
set tabstop=4 " number of visual spaces per TAB
set shiftwidth=4
set expandtab " tabs are spaces
set softtabstop=4 " number of spaces in tab when editing

" set list
set listchars=tab:›\ ,eol:¬,trail:⋅

" show line warp
"set list listchars=tab:>-,nbsp:.,trail:.,extends:>,precedes:<
nmap <F6> :set list!<CR>
" set listchars=eol:$,tab:>\ ,trail:-,extends:>,precedes:<,space:_
set showbreak=›››\ 

scriptencoding utf-8
let mapleader=","


set number " show line numbers
set relativenumber " show relative line numbers
set cmdheight=1 " space between statusbar and bottom of therminal window
set showcmd " show command in bottom bar
set cursorline " highlight current line
" set cursorcolumn
set nocompatible " make vim not vi
set wildmenu " visual autocomplete for comand menu
set wildmode=longest:full,full
set wildignore+=*.class,*.ctxt,*.bluej
" set lazyredraw " redraw only when we need to
set showmatch " highlight matching brackets
set incsearch " search as characters are entered
set hlsearch " highlight matches
set ignorecase " ignore case when searching
set ls=2 " display filename statusbar
set mat=2 " blink for 2 sec
set title " show title in console title bar
set noerrorbells " disable error sound bell
set novisualbell " disable error visual bell

set autoindent
set smarttab

if !has('nvim') && &ttimeoutlen == -1
    set ttimeout
    set ttimeoutlen=100
endif

set laststatus=2

set autoread " autoreload file when changes are made to it
" set scrolloff=1 " always one line above/below cursor

" Mouse scroll
" set mouse=a

" movement
" nnoremap <c-k> 5k
" nnoremap <c-j> 5j

" line warping
set wrap
"set formatoptions=1
set lbr
"set nolist "disable linebreak

" Vim splits
set splitright " vertical split to the right
set splitbelow " horizontal split to the bottom
"
" turn off search highlight
" nnoremap <esc> :nohlsearch<CR>
nnoremap <leader><space> :nohlsearch<CR>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" vim tabs
nnoremap tn :tabnew<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 10gt

" move vertically by visual line (in case of wrap count the wrap as one line)
"nnoremap j gj
"nnoremap k gk

" <C-d> and <C-u> Alternative
nmap K <C-u>
nmap J <C-d> 

" move to beginning/end of line
nmap H ^
nmap L $
vmap H ^
vmap L $

" move between matching opening and ending surrouding brakets { code }
map <tab> %

" save sudo
" nmap <leader>sudo :w !sudo tee % <CR><CR>
nmap <leader>sudo :w suda://%

" disable PageUp and PageDown
nnoremap <PageUp>   <nop>
nnoremap <PageDown> <nop>


" NERDTree
nnoremap <F3> :NERDTreeToggle<CR>

" Remove trailing wthitescape with comand :Spaces
command Spaces %s/\s\+$//e

" Insert tab in insert mod with Shitft-Tab
inoremap <S-Tab> <C-v><Tab>

" UNDO SETTINGS
set undofile " Maintain undo history between sessions
" set undodir=~/.vim/undodir " Undo file directory
set undodir=~/.config/nvim/undodir " Undo file directory

" Rainbow Parentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

"" higlight column right after max textwidth
" set colorcolumn=81
" highlight ColorColumn ctermbg=254 guibg=lightGrey
" highlight ColorColumn ctermbg=235 guibg=lightGrey
" highlight Visual term=reverse cterm=reverse guibg=Grey

""hi ColorColumn gui=reverse cterm=reverse

" set cursorline
" hi CursorLine term=bold  cterm=bold
" highlight CursorLine ctermbg=255 guibg=lightGrey
" hi CursorLine term=bold cterm=bold guibg=Grey40

" Undotree
nnoremap <F5> :UndotreeToggle<CR>

" vim-commentary comments style
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
autocmd FileType lhaskell setlocal commentstring=--\ %s
autocmd Filetype markdown setlocal commentstring=<!---\ %s\ --->
autocmd Filetype markdown setlocal complete+=kspell

" Ctags
set tags+=tags;

" CtrlP
let g:ctrlp_map='<leader><leader>'
nnoremap <leader>f :CtrlPMRUFiles<CR>
nnoremap <leader>t :CtrlPTag<CR>
nnoremap <leader>. :CtrlPBuffer<CR>

set hidden " Allows to change current buffer without saving it

" Buffers
" Saving/Closing Buffer
nnoremap <C-s> :w<CR>
nnoremap <C-q> :bd<CR>
nmap <c-n> :bnext<CR>
nmap <c-p> :bprev<CR>
nnoremap <leader>b :ls<CR>:b<space>

" IndentLine
" let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_char = '│'
let g:indentLine_color_term = 250

set spelllang=pt

" Disable line numbers in markdown
autocmd FileType markdown setlocal norelativenumber

autocmd FileType markdown setlocal spell

" Vim markdown settings
let g:vim_markdown_folding_disabled = 1
