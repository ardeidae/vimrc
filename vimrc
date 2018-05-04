" Vundle installation
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles or vim +BundleInstall +qall
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed.

" Vi IMproved
set nocompatible

" required for Vundle
filetype off

" loading Vundle
if has('unix')
	set runtimepath+=~/.vim/bundle/vundle/
else
endif
	set runtimepath+=~/_vim/bundle/vundle/
call vundle#rc()

" Set leader to , must come before any <leader> mappings
let mapleader=","

" plugins {{{

" Vundle manages Vundle {{{
Bundle 'gmarik/vundle'
nnoremap <LEADER>bi :BundleInstall<CR>
nnoremap <LEADER>bu :BundleInstall!<CR> " Because this also updates
nnoremap <LEADER>bc :BundleClean<CR>
" }}}

" precision colorscheme for the vim text editor
Bundle 'altercation/vim-colors-solarized'

" }}}

" graphical {{{

if has('syntax')
	syntax enable
endif

if has('gui_running')
	set background=dark
	colorscheme solarized
	call togglebg#map("<F5>")
	" show current line
	set guioptions=e
	if exists('+cursorline')
		set cursorline
	endif
else
	set t_Co=256
	colorscheme default
	set background=light
endif

if exists('+colorcolumn')
	" color the 80th column
	set colorcolumn=80
endif

" hide the mouse pointer while typing
set mousehide
if has('mouse')
	" mouse activation
	set mouse=a
endif

" show line number
set number
" line wrapping off
set nowrap
" screen lines to keep above and below the cursor
set scrolloff=5
set sidescrolloff=5
set sidescroll=1
" edit anywhere
set virtualedit=all
" display invisibles chars
set list
set listchars=tab:▸\ ,extends:❯,nbsp:·,trail:·,eol:¬,precedes:❮
" show wrapped lines
set showbreak=↪
" smartly cut lines when list is disabled
set linebreak
" short messages and no intro message
set shortmess=aI
" split below
set splitbelow
" split right
set splitright

" }}}



