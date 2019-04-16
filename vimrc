"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
call plug#begin('~/.vim/plugged')
Plug 'flazz/vim-colorschemes'
" Plug 'https://github.com/altercation/vim-colors-solarized.git'
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'https://github.com/ervandew/supertab.git'
Plug 'https://github.com/tpope/vim-surround.git'
" Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/farmergreg/vim-lastplace.git'
Plug 'https://github.com/tpope/vim-commentary.git'
"Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'sheerun/vim-polyglot'
" Plug 'https://github.com/majutsushi/tagbar.git'
" Plug 'https://github.com/xolox/vim-easytags.git'
" Plug 'https://github.com/xolox/vim-misc.git'

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

Plug 'https://github.com/junegunn/rainbow_parentheses.vim.git'

" Plug 'vimwiki/vimwiki'

"if has('nvim')
"    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
"endif

" Plug 'junegunn/goyo.vim'

Plug 'https://github.com/mbbill/undotree.git'

Plug 'https://github.com/godlygeek/tabular.git'

call plug#end()

set statusline=
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
"set statusline+=\

filetype plugin indent on
set tabstop=4 " number of visual spaces per TAB
set shiftwidth=4
set expandtab " tabs are spaces
set softtabstop=4 " number of spaces in tab when editing

" show line warp
"set list listchars=tab:>-,nbsp:.,trail:.,extends:>,precedes:<
nmap <F6> :set list!<CR>
set listchars=eol:$,tab:>\ ,trail:-,extends:>,precedes:<,space:_
"set list
set showbreak=›››\ 

scriptencoding utf-8
let mapleader=","


set number " show line numbers
set relativenumber " show relative line numbers
set cmdheight=1 " space between statusbar and bottom of therminal window
set showcmd " show command in bottom bar
"set cursorline " highlight current line
"set cursorcolumn
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
set mouse=a

" movement
" nnoremap <c-k> 5k
" nnoremap <c-j> 5j

" line warping
set wrap

"set formatoptions=1
set lbr
"set nolist "disable linebreak


" turn off search highlight
nnoremap <esc> :nohlsearch<CR>

" Vim splits
set splitright " vertical split to the right
set splitbelow " horizontal split to the bottom

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


"Copy paste comands to work with system clipboard (gvim needed)
"vnoremap <C-y> "+y
"map <C-p> "+p

" move vertically by visual line (in case of wrap count the wrap as one line)
"nnoremap j gj
"nnoremap k gk

" move to beginning/end of line
"nnoremap H ^
"nnoremap L $

" more sensible w key
nnoremap w W

" keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv

" move between matching opening and ending surrouding brakets { code }
map <tab> %

" save sudo
nmap <leader>sudo :w !sudo tee % <CR><CR>

" disable PageUp and PageDown
nnoremap <PageUp>   <nop>
nnoremap <PageDown> <nop>


" NERDTree
nnoremap <F3> :NERDTreeToggle<CR>

" Remove trailing wthitescape on save :w
command Spaces %s/\s\+$//e

" Insert tab in insert mod with Shitft-Tab
inoremap <S-Tab> <C-v><Tab>

" Colors
"set termguicolors
set t_Co=256
set background=dark
syntax enable " enalbe syntax processing
colorscheme vividchalk
"colorscheme dracula

" UNDO SETTINGS
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

"let wiki_1 = {}
"let wiki_1.path = '~/Documents/notes/'
"let wiki_1.syntax = 'markdown'
"let wiki_1.ext = '.md'
"
"let g:vimwiki_list = [wiki_1]
"let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Markdown Preview
" let g:mkdp_auto_start = 0
" let g:mkdp_command_for_global = 1

" Rainbow Parentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

" Goyo maping
" map <leader>f :Goyo<CR>

"" higlight column right after max textwidth
"set colorcolumn=+1
"
"set colorcolumn=80
"highlight ColorColumn ctermbg=234 guibg=lightgrey

""hi ColorColumn gui=reverse cterm=reverse

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
"set cursorline
"hi CursorLine term=bold cterm=bold
"hi CursorLine term=bold cterm=bold guibg=Grey40
" Spell check
" augroup markdownSpell
"     autocmd!
"     autocmd FileType markdown setlocal spell spelllang=pt
"     autocmd BufRead,BufNewFile *.md setlocal spell spelllang=pt
" augroup END

" Undotree
nnoremap <F5> :UndotreeToggle<CR>

" vim-commentary comments style
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

" Ctags
set tags+=tags;

" CtrlP
let g:ctrlp_map='<leader><leader>'
nnoremap <leader>f :CtrlPMRUFiles<CR>
nnoremap <leader>t :CtrlPTag<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" Buffers
nnoremap <c-p> :bnext<CR>
nnoremap <c-n> :bprev<CR>
nnoremap <leader>. :ls<CR>:b<space>

" TagBar
" nmap <F8> :Tagbar<CR>
