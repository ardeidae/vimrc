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

" colorschemes {{{

" precision colorscheme for the vim text editor
Bundle 'altercation/vim-colors-solarized'
" a port of the monokai scheme for TextMate
Bundle 'vim-scripts/molokai'

" }}}

" tools {{{

" }}}

" vim-statline {{{
" Add useful informations to Vim statusline
Bundle 'scrooloose/vim-statline'
let g:statline_fugitive=1
let g:statline_filename_relative=1
let g:statline_show_charcode=1
" }}}

" tabular {{{
" Vim script for text filtering and alignment
Bundle 'godlygeek/tabular'
nnoremap <LEADER>t= :Tabularize /=<CR>
vnoremap <LEADER>t= :Tabularize /=<CR>
nnoremap <LEADER>t: :Tabularize /:\zs<CR>
vnoremap <LEADER>t: :Tabularize /:\zs<CR>
nnoremap <LEADER>t, :Tabularize /,\zs<CR>
vnoremap <LEADER>t, :Tabularize /,\zs<CR>
nnoremap <LEADER>t> :Tabularize /=>\zs<CR>
vnoremap <LEADER>t> :Tabularize /=>\zs<CR>
nnoremap <LEADER>t- :Tabularize /-<CR>
vnoremap <LEADER>t- :Tabularize /-<CR>
nnoremap <LEADER>t" :Tabularize /"<CR>
vnoremap <LEADER>t" :Tabularize /"<CR>
" }}}

" NERDTree {{{
" A tree explorer plugin for vim
Bundle 'scrooloose/nerdtree'
" Change the NERDTree directory to the root node
let NERDTreeChDirMode=2
" store the bookmarks file
if has('unix')
	let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
else
	let NERDTreeBookmarksFile=expand("$HOME/_vim/NERDTreeBookmarks")
endif
" show the bookmarks table on startup
let NERDTreeShowBookmarks=1
" show hidden files
let NERDTreeShowHidden=1
" highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1
" single click to fold/unfold directories and double click to open files
let NERDTreeMouseMode=2
" show line numbers
let NERDTreeShowLineNumbers=1
" nerdtree window width
let NERDTreeWinSize=40
" NERDTree recursively opens dirs that have only one child which is also a dir
let NERDTreeCasadeOpenSingleChildDir=1
" don't display these kinds of files
let NERDTreeIgnore=[ '\.class$', '\.o$', '^\.git$', '^\.svn$' ]

nnoremap <LEADER>nn :NERDTreeToggle<CR>
nnoremap <LEADER>nf :NERDTreeFind<CR>
nnoremap <LEADER>nc :NERDTreeClose<CR>
" }}}

" }}}

" }}}

" syntax {{{

" add CSS3 syntax support to vim's built-in `syntax/css.vim`
Bundle 'hail2u/vim-css3-syntax'

" vim syntax for LESS (dynamic CSS)
Bundle 'groenewege/vim-less'

" }}}

" }}}

filetype plugin indent on

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



