"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/romainl/flattened.git'
Plug 'leissa/vim-acme'
Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'https://github.com/nbardiuk/vim-gol.git'
Plug 'https://github.com/justinmk/vim-dirvish.git'
Plug 'https://github.com/robertmeta/nofrils.git'
Plug 'justinmk/vim-sneak'
" " Plug 'unblevable/quick-scope'
" " Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/tpope/vim-eunuch.git'
Plug 'https://github.com/arzg/vim-colors-xcode.git'
" " Plug 'https://github.com/tpope/vim-vinegar.git'
" Plug 'https://github.com/tpope/vim-vividchalk.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'cormacrelf/vim-colors-github'
" Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
Plug 'https://github.com/rakr/vim-two-firewatch.git'
Plug 'https://github.com/romainl/Apprentice.git'
Plug 'https://github.com/jonathanfilip/vim-lucius.git'
Plug 'https://github.com/rakr/vim-one.git'
" " Plug 'https://github.com/ludovicchabant/vim-gutentags.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/mbbill/undotree.git'
Plug 'https://github.com/godlygeek/tabular.git'
call plug#end()

if has('gui')
    set guifont=Inconsolata\ 14
    set guicursor=i-n-v-c:block-Cursor
    set guicursor+=i-n-v-c:blinkon0
    set guioptions-=m  "menu bar
    set guioptions-=T  "toolbar
    set guioptions-=r  "scrollbar
end

" Basic configs
scriptencoding utf-8
let mapleader="\<space>"
set nocompatible " make vim not vi

" Clipboard
set clipboard=unnamedplus

" Syntax highlighting
" set t_Co=256
" set termguicolors
set background=light
syntax enable " enalbe syntax processing
colorscheme github
" colorscheme nofrils-acme
" colorscheme flattened_light
let g:nofrils_heavylinenumbers=1
let g:nofrils_strbackgrounds=1
let g:nofrils_heavycomments=1

" Statusline
set laststatus=2
set statusline=
set statusline+=%f
set statusline+=\ 
set statusline+=%m
set statusline+=%r
set statusline+=%=
set statusline+=%y
set statusline+=\ 
set statusline+=%{strlen(&fenc)?&fenc:'none'}
set statusline+=\ 
set statusline+=[
set statusline+=%{strlen(&fenc)?&fenc:'none'}
set statusline+=]
set statusline+=\ 
set statusline+=%l
set statusline+=:
set statusline+=%c

" Completion
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set completeopt+=menuone,preview


" Indentation
set tabstop=4 " number of visual spaces per TAB
set shiftwidth=4
set expandtab " tabs are spaces
set softtabstop=4 " number of spaces in tab when editing
set autoindent
set smarttab

" Line wraping
set showbreak=↳\ 
set wrap
set linebreak
set lbr

" Visual guides
set relativenumber " show relative line numbers
" set cursorline " highlight current line
set showmatch " highlight matching brackets

" Vim search
set incsearch " search as characters are entered
set hlsearch " highlight matches
set ignorecase " ignore case when searching

set wildmode=longest:full,full
set wildignore+=*.class,*.ctxt,*.bluej
set noerrorbells " disable error sound bell
set novisualbell " disable error visual bell
" set lazyredraw " redraw only when we need to

" Vim splits
set splitright " vertical split to the right
set splitbelow " horizontal split to the bottom

set autoread " autoreload file when changes are made to it
set scrolloff=1 " always one line above/below cursor

" Mouse scroll
set mouse=a

" movement
noremap 0 ^
noremap ^ 0


" Change split size
nnoremap <silent> <C-Right> :vertical resize +2<CR>
nnoremap <silent> <C-Left> :vertical resize -2<CR>
nnoremap <silent> <C-Up> :resize +2<CR>
nnoremap <silent> <C-Down> :resize -2<CR>

" Change 2 split windows from vert/horz
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

" turn off search highlight
" nnoremap <esc> :nohlsearch<CR>
nnoremap <leader><space> :nohlsearch<CR>

" save sudo not working in neovim
nmap <leader>sudo :w !sudo tee % <CR><CR>
" nmap <leader>sudo :w suda://%

" disable PageUp and PageDown
nnoremap <PageUp>   <nop>
nnoremap <PageDown> <nop>

" Remove trailing whitescape with comand :Spaces
command Spaces %s/\s\+$//e

" Insert tab in insert mod with Shitft-Tab
inoremap <S-Tab> <C-v><Tab>


" UNDO SETTINGS
set undofile " Maintain undo history between sessions
" set undodir=~/.vim/undodir " Undo file directory
set undodir=~/.config/nvim/undodir " Undo file directory

" Undotree
nnoremap <F5> :UndotreeToggle<CR>

" vim-commentary comments style
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
autocmd FileType lhaskell setlocal commentstring=--\ %s
autocmd Filetype markdown setlocal commentstring=<!---\ %s\ --->
" autocmd Filetype markdown setlocal complete+=kspell

set complete+=kspell


" CtrlP
" let g:ctrlp_map='<leader><leader>'
" nnoremap <leader>f :CtrlPMRUFiles<CR>
" nnoremap <leader>t :CtrlPTag<CR>
" nnoremap <leader>. :CtrlPBuffer<CR>
nnoremap <leader>f :CtrlP .<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlPTag<cr>

" when opening multiple files open then in hidden buffers
let g:ctrlp_open_multiple_files = 'ir'
let g:ctrlp_map = '<Nop>'
let g:ctrlp_match_window = 'min:4,max:999'

set hidden " Allows to change current buffer without saving it
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c

" Buffers
" Saving/Closing Buffer
nnoremap <C-s> :w<CR>
nnoremap <C-q> :bd<CR>
nmap <c-n> :bnext<CR>
nmap <c-p> :bprev<CR>
" nnoremap <leader>b :ls<CR>:b<space>

set spelllang=pt

hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl
