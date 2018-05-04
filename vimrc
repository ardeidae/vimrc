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

" mkdir -p ~/.vim/tmp/{undo,swap}
" curl http://betterthangrep.com/ack-standalone > /bin/ack && chmod 0755 !#:3

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
nnoremap <Leader>bi :BundleInstall<CR>
nnoremap <Leader>bu :BundleInstall!<CR> " Because this also updates
nnoremap <Leader>bc :BundleClean<CR>
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
nnoremap <Leader>t= :Tabularize /=<CR>
vnoremap <Leader>t= :Tabularize /=<CR>
nnoremap <Leader>t: :Tabularize /:\zs<CR>
vnoremap <Leader>t: :Tabularize /:\zs<CR>
nnoremap <Leader>t, :Tabularize /,\zs<CR>
vnoremap <Leader>t, :Tabularize /,\zs<CR>
nnoremap <Leader>t> :Tabularize /=>\zs<CR>
vnoremap <Leader>t> :Tabularize /=>\zs<CR>
nnoremap <Leader>t- :Tabularize /-<CR>
vnoremap <Leader>t- :Tabularize /-<CR>
nnoremap <Leader>t" :Tabularize /"<CR>
vnoremap <Leader>t" :Tabularize /"<CR>
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

nnoremap <Leader>nn :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>nc :NERDTreeClose<CR>
" }}}


" vim-fugitive {{{
" a Git wrapper so awesome, it should be illegal
Bundle 'tpope/vim-fugitive'
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gu :Git pull<CR>
nnoremap <Leader>gd :Gdiff<CR>
" }}}

" vcscommand {{{
" integration with many version control systems
Bundle 'git://repo.or.cz/vcscommand'
" }}}

" }}}

" snipmate {{{
" implements some of TextMate's snippets features in Vim
Bundle 'msanders/snipmate.vim'
" }}}

" ack {{{
" better than grep
Bundle 'mileszs/ack.vim'
" http://stevengharms.com/use-ack-instead-of-grep-to-parse-text-files
" http://betterthangrep.com/documentation/
" http://betterthangrep.com/why-ack/
nnoremap <silent> <Leader>as :AckFromSearch<CR>
" }}}

" }}}

" tcomment {{{
" comment vim-plugin that also handles embedded filetypes
Bundle 'tomtom/tcomment_vim'
" }}}

" syntastic
" Syntax checking hacks for vim
Bundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=1
let g:syntastic_enable_balloons=1
let g:syntastic_enable_highlighting=1
" required tools to check syntax:
" c: gcc
" c++: g++
" html: tidy
" xhtml: tidy
" java: javac
" perl: perl
" php: php
" xml: xmllint
"
" install from nodejs
" css: csslint
" js: jslint
" json: jsonlint
" less: less
" yaml: js-yaml
" }}}

" }}}

" syntax {{{

" add CSS3 syntax support to vim's built-in `syntax/css.vim`
Bundle 'hail2u/vim-css3-syntax'

" vim syntax for LESS (dynamic CSS)
Bundle 'groenewege/vim-less'

" }}}

filetype plugin indent on

" general {{{

" utf-8 encoding
set termencoding=utf-8
set encoding=utf-8
" enable modeline
set modeline
" lines to read for modeline
set modelines=5
" don't flash
set visualbell
" don't beep
set noerrorbells
" tab spaces size
set tabstop=4
set softtabstop=4
set shiftwidth=4
" allow backspacing over indent, eol, and the start of an insert
set backspace=indent,eol,start
" copy indent from current line when starting a new line
set autoindent
" keyword completion
set complete=.,w,b,u,t,i,U,kspell
" extra characters that are parts of words
set iskeyword+=$,@
" only one space on joined lines
set nojoinspaces
" change the terminal's title
set title
" screen will not be redrawn while executing macros
set lazyredraw
" fast terminal connection
set ttyfast
" add/substract alpha, hex and dec values, but not octal
set nrformats=hex,alpha
" ignore changes in amount of white space.
set diffopt+=iwhite
" ~ command behaves like an operator
set tildeop
" same column with commands G, H, M, L, gg...
set nostartofline
" spell checkin
if has('spell')
	set spelllang=fr
endif

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

" history {{{

" remember more commands and search history
set history=1000
" use many muchos levels of undo
set undolevels=1000
if v:version >= 703
	" use undofile
	set undofile
	if has('unix')
		set undodir=~/.vim/tmp/undo
	else
		set undodir=~/_vim/tmp/undo
	endif
endif

" }}}

" backup {{{

" swapfile directory
if has('unix')
	set directory=~/.vim/tmp/swap
else
	set directory=~/_vim/tmp/swap
endif
" don't keep backup file
set nobackup
set nowritebackup

" }}}
"
" the status line {{{

" turn on wild menu
set wildmenu
" completion mode
set wildmode=longest:full,full
" ignore some types of files
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,.svn,.git,CVS,.hg,*.obj,.DS_Store
" always show current position
set ruler
" the commandbar height
set cmdheight=1
" always put a status line in, even if there is only one window
set laststatus=2
" Show the current mode
set showmode
" show the command in the status line
set showcmd

" }}}

" searching {{{

" highlight search results
set hlsearch
" incremental search
set incsearch
" show matching parenthesis
set showmatch
set matchpairs+=<:>
set matchpairs+==:;
set noignorecase
" disable search display
nnoremap <silent> <Leader>/ :nohlsearch<CR>
" doesn't loop when searching
" set nowrapscan

" }}}

" folding {{{

" enable folding
set foldenable
" add a fold column
set foldcolumn=1
" detect triple-{ style fold markers
set foldmethod=marker
" start out with everything folded
set foldlevelstart=100
" which commands trigger auto-unfold
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
" set a nicer foldtext function
set foldtext=MyFoldText()
function MyFoldText()
  let nucolwidth = &fdc + &number*&numberwidth
  let winwd = winwidth(0) - nucolwidth - 10
  let foldlinecount = foldclosedend(v:foldstart) - foldclosed(v:foldstart) + 1
  let fdnfo = string(v:foldlevel) . ", " . string(foldlinecount) . " "
  let line =  strpart(getline(v:foldstart), 0 , winwd - len(fdnfo))
  let fillcharcount = winwd - len(line) - len(fdnfo)
  return line . repeat(" ",fillcharcount) . fdnfo
endfunction
"}}}

" functions {{{

function! Preserve(command)
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l=line(".")
	let c=col(".")
	" do the business:
	execute a:command
	" clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

" remove trailing whitespaces
command! StripTrailingWhiteSpaces call Preserve("%s/\\s\\+$//e")
" remove empty lines
command! RemoveEmptyLines call Preserve("%g/^\\s*$/d")
" convert empty line blocks into one empty line
command! RemoveEmptyLinesBlocks call Preserve("%g/^$/,/./-j")
" reindent entire file
command! ReIndent call Preserve("normal gg=G")

" switch between number and relative number
function! g:ToggleNuMode()
	if (&relativenumber == 1)
		set number
		set number?
	else
		set relativenumber
		set relativenumber?
	endif
endfunc

" }}}


" mappings {{{
" disable F1 key
inoremap <F1> <Esc>
vnoremap <F1> <Esc>
" switch list
nnoremap <F1> :set invlist<CR>:set list?<CR>

" switch between number and relative number
nnoremap <silent> <F2> :call g:ToggleNuMode()<CR>

if has('spell')
	" enable / disable spell checking
	nnoremap <silent> <F3> :set invspell<CR>:set spell?<CR>
endif

" enable / disable wrapping
nnoremap <silent> <F4> :set invwrap<CR>:set wrap?<CR>

" }}}

