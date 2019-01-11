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
"set softtabstop=4 " number of spaces in tab when editing

set listchars=space:·,tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
"set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»

" show line warp
set showbreak=\ ↳\
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
"set list lcs=trail:·,tab:»·
"set list listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set t_Co=256
set background=dark
scriptencoding utf-8
let mapleader=","
"colorscheme solarized
"colorscheme gruvbox
"colorscheme monochrome
"color dracula
"colorscheme paramount
syntax enable " enalbe syntax processing
set number " show line numbers
set relativenumber " show relative line numbers
set cmdheight=1 " space between statusbar and bottom of therminal window
set showcmd " show command in bottom bar
set cursorline " highlight current line
"set cursorcolumn " highlight current column
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
set clipboard+=unnamedplus

" Mouse scroll
set mouse=a
"if !has('nvim')
"    set ttymouse=xterm
"endif

" movement
nnoremap <c-k> 5k
nnoremap <c-j> 5j

" line warping
set wrap

set formatoptions=1
set lbr
set nolist "disable linebreak


" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" color selected text
"hi Visual term=reverse cterm=reverse guibg=Grey
"highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE
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
nnoremap H ^
nnoremap L $

" more sensible w key
"nnoremap w W

" keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv

" nove between matching opening and ending cide; { code}
map <tab> %

" save sudo
map <leader>sudo :w !sudo tee % <CR><CR>

" disable PageUp and PageDown
nnoremap <PageUp>   <nop>
inoremap <PageUp>   <nop>
nnoremap <PageDown> <nop>
inoremap <PageDown> <nop>
vnoremap <PageUp>   <nop>
vnoremap <PageUp>   <nop>
vnoremap <PageDown> <nop>
vnoremap <PageDown> <nop>

" vim indent guides
"let g:indentline_char = '¦'
"let g:indentline_color_term = 239
"let g:indentline_color_dark = 2
"let g:indentline_leadingspacechar = '-'
"let g:indentline_leadingspaceenabled = 1
"let g:indentline_enabled = 1

" delimitMate
let delimitMate_expand_cr = 1

" NERDTree
nnoremap <F3> :NERDTreeToggle<CR>

" Remoce trailing wthitescape on save :w
command Spaces %s/\s\+$//e

inoremap <S-Tab> <C-v><Tab>

"nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" Tabline
"hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
"hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
"hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE






" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)




call plug#begin('~/.vim/plugged')
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/ervandew/supertab.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
"Plug 'https://github.com/Yggdroot/indentLine.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/morhetz/gruvbox.git'
"Plug 'https://github.com/flazz/vim-colorschemes.git'
"Plug 'https://github.com/vim-airline/vim-airline.git'
"Plug 'https://github.com/vim-airline/vim-airline-themes.git'
"Plug 'https://github.com/powerline/powerline.git'
Plug 'https://github.com/Raimondi/delimitMate.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/farmergreg/vim-lastplace.git'
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/mkitt/tabline.vim.git'
Plug 'junegunn/vim-easy-align'
"Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'junegunn/seoul256.vim'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'fxn/vim-monochrome'
Plug 'owickstrom/vim-colors-paramount'
"Plug 'https://github.com/Valloric/YouCompleteMe.git'
"Plug 'https://github.com/junegunn/rainbow_parentheses.vim.git'
Plug 'sheerun/vim-polyglot'
"Plug 'andymass/vim-matchup'
"Plug 'https://github.com/raghur/vim-ghost.git'
"Plug 'https://github.com/pandysong/ghost-text.vim.git'
call plug#end()
"colorscheme solarized
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
"let g:airline_theme='gruvbox'
"let g:airline#extensions#whitespace#show_message = 0
"let g:airline#extensions#whitespace#checks = []
"colorscheme nord
