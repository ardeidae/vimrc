" Vundle installation
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles or vim +PluginInstall +qall
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed.

" mkdir -p -m 0700 ~/.vim/tmp/{swap,undo,backup}
" curl http://betterthangrep.com/ack-standalone > /bin/ack && chmod 0755 !#:3

" Vi IMproved
set nocompatible

" required for Vundle
filetype off

" loading Vundle
set runtimepath+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Set leader to , must come before any <Leader> mappings
let mapleader=","

" plugins {{{

" Vundle manages Vundle {{{
Plugin 'https://github.com/VundleVim/Vundle.vim.git'
nnoremap <Leader>bi :PluginInstall<CR>
nnoremap <Leader>bu :PluginInstall!<CR> " Because this also updates
nnoremap <Leader>bc :PluginClean<CR>
" }}}

" colorschemes {{{

" a port of the monokai scheme for TextMate
Plugin 'https://github.com/vim-scripts/molokai.git'
" summerfruit color scheme in 256 colors
Plugin 'https://github.com/baeuml/summerfruit256.vim.git'
" badwolf, a Vim color scheme
Plugin 'https://github.com/sjl/badwolf.git'
" A Vim colorscheme based on Github's syntax highlighting as of 2018.
Plugin 'https://github.com/cormacrelf/vim-colors-github.git'

" }}}

" tools {{{


" vim-statline {{{
" Add useful informations to Vim statusline
Plugin 'https://github.com/scrooloose/vim-statline.git'
let g:statline_fugitive=1
let g:statline_filename_relative=1
let g:statline_show_charcode=1
" }}}

" tabular {{{
" Vim script for text filtering and alignment
Plugin 'https://github.com/godlygeek/tabular.git'
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
Plugin 'https://github.com/scrooloose/nerdtree.git'
" Change the NERDTree directory to the root node
let NERDTreeChDirMode=2
" store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
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
Plugin 'https://github.com/tpope/vim-fugitive.git'
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gu :Git pull<CR>
nnoremap <Leader>gd :Gdiff<CR>
" }}}

" vcscommand {{{
" integration with many version control systems
Plugin 'https://repo.or.cz/vcscommand.git'
" }}}

" }}}

" snipmate {{{
" implements some of TextMate's snippets features in Vim
Plugin 'https://github.com/msanders/snipmate.vim.git'
" }}}

" ack {{{
" better than grep
Plugin 'https://github.com/mileszs/ack.vim.git'
" http://stevengharms.com/use-ack-instead-of-grep-to-parse-text-files
" http://betterthangrep.com/documentation/
" http://betterthangrep.com/why-ack/
nnoremap <silent> <Leader>as :AckFromSearch<CR>
" }}}

" }}}

" tcomment {{{
" comment vim-plugin that also handles embedded filetypes
Plugin 'https://github.com/tomtom/tcomment_vim.git'
" }}}

" syntastic {{{
" Syntax checking hacks for vim
Plugin 'https://github.com/scrooloose/syntastic.git'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=1
let g:syntastic_enable_balloons=1
let g:syntastic_enable_highlighting=1
" Passive Java checking. To check, :SyntasticCheck.
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['java', 'c', 'cpp'] }
" allow shellcheck to follow sourced files.
let g:syntastic_sh_shellcheck_args="-x"
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

" ctrlp.vim {{{
" Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'https://github.com/kien/ctrlp.vim.git'
" }}}

" }}}

" syntax {{{

" add CSS3 syntax support to vim's built-in `syntax/css.vim`
Plugin 'https://github.com/hail2u/vim-css3-syntax.git'

" vim syntax for LESS (dynamic CSS)
Plugin 'https://github.com/groenewege/vim-less.git'

" Vim syntax file & snippets for Docker's Dockerfile
Bundle "https://github.com/ekalinin/Dockerfile.vim.git"

" Add additional support for Ansible in VIM
Plugin 'https://github.com/chase/vim-ansible-yaml.git'

" Ferm syntax highlighting (For Easy Rule Making), a frontend for iptables.
Plugin 'https://github.com/vim-scripts/ferm.vim.git'

" }}}

" }}}

call vundle#end()

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
set t_vb=
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
" only one space on joined lines
set nojoinspaces
" change the terminal's title
set title
" screen will not be redrawn while executing macros
set lazyredraw
" fast terminal connection
set ttyfast
" add/substract only dec values
set nrformats=
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

set tabpagemax=200

" }}}

" graphical {{{

if has('syntax')
	syntax enable
endif

if has('gui_running')
	set background=light
	silent! colorscheme summerfruit256
	" show current line
	set guioptions=e
	" show menu item on windows
	if has("win32")
		set guioptions+=T
	endif
	if exists('+cursorline')
		set cursorline
	endif
else
	set background=dark
	silent! colorscheme summerfruit256
endif

if exists('+colorcolumn')
	" color textwidth column +1
	set colorcolumn=+1
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
" don't display invisibles chars by default
set nolist
set listchars=tab:▸\ ,extends:❯,nbsp:·,trail:·,eol:¬,precedes:❮
" show wrapped lines
set showbreak=↪
" smartly cut lines when list is disabled
set linebreak
" short messages, message for reading a file overwrites any previous message,
" and no intro message
set shortmess=aoOI
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
	set undodir=~/.vim/tmp/undo
endif

" }}}

" backup {{{

" swapfile directory
set directory=~/.vim/tmp/swap
" keep backup file
set backup
set writebackup
set backupdir=~/.vim/tmp/backup

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
command! RemoveEmptyLinesBlocks call Preserve('%g/^\_$\n\_^$/d')
" reindent entire file
command! ReIndent call Preserve("normal gg=G<C-o><C-o>zz")

" switch between number, relative number and no number
function! g:ToggleNumberMode()
	if exists('+relativenumber')
		if &relativenumber
			set norelativenumber
			set number
			set number?
		elseif &number
			set nonumber
			set nonumber?
		else
			set relativenumber
			set relativenumber?
		endif
	else
		if &number
			set nonumber
			set nonumber?
		else
			set number
			set number?
		endif
	endif
endfunc

" switch between light and dark background
function! g:ToggleBackground()
	if exists('+background')
		if &background=='light'
			set background=dark
		else
			set background=light
		endif
	endif
endfunc

" switch textwidth
function! g:ToggleTextWidth()
	if &textwidth
		let s:save_textwidth = &textwidth
		set textwidth=0
	else
		if exists("s:save_textwidth")
			let &textwidth = s:save_textwidth
			unlet s:save_textwidth
		else
			" default value if 'textwidth' is zero the first time
			set textwidth=80
		endif
	endif
	set textwidth?
endfunc

" switch virtual edit
function! g:ToggleVirtualEdit()
	if &virtualedit=='all'
		" disable virtual edit
		set virtualedit=
	else
		" edit anywhere
		set virtualedit=all
	endif
	set virtualedit?
endfunc

" }}}


" mappings {{{

" disable ex mode key
nnoremap <silent> Q <Nop>

" disable F1 key
inoremap <F1> <Esc>
vnoremap <F1> <Esc>
" switch list
nnoremap <F1> :set invlist<CR>:set list?<CR>

" switch between number and relative number
nnoremap <silent> <F2> :call g:ToggleNumberMode()<CR>

" switch between light and dark background
nnoremap <silent> <F3> :call g:ToggleBackground()<CR>

if has('spell')
	" enable / disable spell checking
	nnoremap <silent> <F4> :set invspell<CR>:set spell?<CR>
endif

" enable / disable wrapping
nnoremap <silent> <F5> :set invwrap<CR>:set wrap?<CR>

" enable / disable textwidth
nnoremap <silent> <F6> :call g:ToggleTextWidth()<CR>

" toggle paste mode
set pastetoggle=<F7>

" enable / disable virtual edit.
nnoremap <silent> <F8> :call g:ToggleVirtualEdit()<CR>

" Underline the current line with '='
nnoremap <silent> <Leader>u= yypVr=
nnoremap <silent> <Leader>u- yypVr-
nnoremap <silent> <Leader>U= yyPVr=
nnoremap <silent> <Leader>U- yyPVr-

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" move lines with shift-up or shift-down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
vnoremap <S-Up> :m '<-2<CR>gv=gv
vnoremap <S-Down> :m '>+1<CR>gv=gv

" emacs bindings in command line mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" edit / reload vimrc
nnoremap <silent> <Leader>ve :edit $MYVIMRC<CR>
nnoremap <silent> <Leader>vs :source $MYVIMRC<CR>

nnoremap <Leader>$ :StripTrailingWhiteSpaces<CR>
nnoremap <Leader>= :ReIndent<CR>
nnoremap <Leader><Space> :RemoveEmptyLines<CR>
nnoremap <Leader>b<Space> :RemoveEmptyLinesBlocks<CR>

" vertical split
nnoremap <Leader>sv <C-w>v<C-w>l
" horizontal split
nnoremap <Leader>sh <C-w>s<C-w>j

" generate HTML version current buffer using current color scheme
map <silent> <Leader>2h :runtime! syntax/2html.vim<CR>

" format paragraph
nnoremap <Leader>q gqip

" fold xml/html tag
nnoremap <Leader>ft Vatzf

" run a makefile
nnoremap <Leader>m :make<CR>

" make the current file executable
nnoremap <Leader>x :w<CR>:!chmod +x %<CR>:e<CR>

" }}}

" autocmd {{{

" only do this part when compiled with support for autocommands
if has("autocmd")
	" strip trailing white spaces on write
	autocmd BufWritePre * :StripTrailingWhiteSpaces

	autocmd Filetype make setlocal noexpandtab
	autocmd FileType yaml setlocal expandtab
	autocmd Filetype less,css setlocal iskeyword+=-
	autocmd Filetype php setlocal iskeyword+=$
	" text formatting {{{
	" gqip to format paragraph, see :h text-objects
	" t: Auto-wrap text using textwidth
	" w: Trailing white space indicates a paragraph continues in the next
	" line. A line that ends in a non-white character ends a paragraph.
	" a: Automatic formatting of paragraphs.  Every time text is inserted or
	" deleted the paragraph will be reformatted. When the 'c' flag is present
	" this only happens for recognized comments.
	" }}}
	autocmd FileType text setlocal textwidth=80 formatoptions+=twa

	" treat .rss files as XML
	autocmd BufNewFile,BufRead *.rss setfiletype xml
	" recognize *.txt as text files.
	autocmd BufRead,BufNewFile *.txt setfiletype text
	" readonly on log files
	autocmd BufRead *.log* setlocal readonly nowrap

	" specific file I use at work
	autocmd BufRead,BufNewFile FR.txt 2match Title /^\(Lundi\|Mardi\|Mercredi\|Jeudi\|Vendredi\|Samedi\|Dimanche\)\s*[0-9]\{1,2}\/[0-9]\{1,2\}\/[0-9]\{1,4\}\s*:/
	autocmd BufRead,BufNewFile FR.txt match MatchParen /^--------------------------------------------------------------------------------$/

endif

" }}}

" reminder {{{
" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
" http://vim.wikia.com/wiki/Macros
" :h c_CTRL-F to switch to command-line window
" :h CTRL-^ to open previously edited file
" }}}

if &diff
	" set a colorscheme improved for diff
	colorscheme github
	" add a mapping to exit with status 1, usefull when using git difftool or
	" diffmerge on several files: end the diff process.
	map Q :cquit<CR>
endif
