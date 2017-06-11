call plug#begin('~/.vim/plugged')
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/Yggdroot/indentLine.git'
Plug 'https://github.com/Valloric/YouCompleteMe.git'
Plug 'https://github.com/flazz/vim-colorschemes.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/Raimondi/delimitMate.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/luochen1990/rainbow.git'
Plug 'https://github.com/farmergreg/vim-lastplace.git'
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/mkitt/tabline.vim.git'
"Plug 'https://github.com/vim-scripts/Conque-Shell.git'
"Plug 'https://github.com/vim-scripts/Conque-GDB.git'
"Plug 'https://github.com/junegunn/rainbow_parentheses.vim.git'
"Plug 'https://github.com/vim-airline/vim-airline-themes.git'
call plug#end()
set clipboard=unnamed
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
" Your Complete Me
set completeopt-=preview
" vim indent guides
let g:indentline_char = '¦'
"let g:indentline_color_term = 239
"let g:indentline_color_dark = 2
let g:indentline_leadingspacechar = '-'
"let g:indentline_leadingspaceenabled = 1
"let g:indentline_enabled = 1
" delimitMate
let delimitMate_expand_cr = 1
" NERDTree
nnoremap <F3> :NERDTreeToggle<CR>
" Remoce trailing wthitescape on save :w
autocmd BufWritePre * :%s/\s\+$//e
" Tabline
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE
" Conque-GDB
"let g:ConqueTerm_Color = 2
"let g:ConqueTerm_CloseOnEnd = 1
"let g:ConqueTerm_StartMessages = 0
" Rainbow Parentheses
let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
