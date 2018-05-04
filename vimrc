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
nnoremap <SILENT> <LEADER>as :AckFromSearch<CR>
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

" spell {{{

if has('spell')
	" active / désactive la correction orthographique
	nnoremap <SILENT> <F3> :set spell!<CR> :set spell?<CR>
	set spelllang=fr
endif

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
nnoremap <SILENT> <LEADER>/ :nohlsearch<CR>
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
function! MyFoldText()
  let line = getline(v:foldstart)
  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    let linenum = v:foldstart + 1
    while linenum < v:foldend
      let line = getline( linenum )
      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      if comment_content != ''
        break
      endif
      let linenum = linenum + 1
    endwhile
    let sub = initial . ' ' . comment_content
  else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
      let line = getline(v:foldend)
      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
      if endbrace == '}'
        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
      endif
    endif
  endif
  let n = v:foldend - v:foldstart + 1
  let info = " " . n . " lines"
  let sub = sub . "                                                                                                                  "
  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  let fold_w = getwinvar( 0, '&foldcolumn' )
  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  return sub . info
endfunction
"}}}
