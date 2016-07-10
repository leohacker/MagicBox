set nocompatible

""" distributed vimrc
set exrc                " enable per-directory vimrc
set secure              " disable unsafe commands in local .vimrc file

""" User Interface
set ruler               " Show the row and column number of the cursor position in the status line.
set wildmenu            " Popup a window showing all matching command above command line when autocomplete.
"set cmdheight=2         " command line height
set showmode
set mouse=a             " enable mouse in all modes.

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

""" General
set hidden              " hidden current unsaved buffer if open a new buffer.
set modelines=0         " disable modeline for security reason.
                        " modeline in file header like this: /* vim: set ts=8 sw=4 tw=0 noet : */
set history=100         " Sets how many lines of history VIM has to remember.
set clipboard=unnamed

""" Behavior
" backspace key behavior
set backspace=eol,start,indent
set nowrap

" highlight end of line whitespaces.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

set autoread            " Set to auto read when a file is changed from the outside.
set autowrite		    " Automatically save before commands like :next and :make

map j gj                " move cursor in wrap line.
map k gk

" Jump to the last position when reopening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" search
set incsearch           " incremental search mode
set hlsearch            " highlight search things
set ignorecase          " ignore case when searching
set smartcase           " only works when ignorecase on
set magic               " turn magic on for regex.

" Loading the plugin and indentation rules according to the detected filetype.
filetype plugin indent on

" encoding
set encoding=utf-8
set fileencodings=utf-8,latin-1
set ffs=unix,dos,mac    " Use unix as the standard file type

""" Coding
syntax on
set number		        " show line number
set showmatch 		    " show matching brackets.
set matchtime=2         " the length of time to show matching paren.
set foldlevel=9         " open all folds

set iskeyword+=_,$,@,%,#,-  " don't linebreak when encounter these characters.

set tabstop=4           " The number of spaces count for a TAB.
set softtabstop=4	    " The number of spaces inserted when typing TAB. If not expandtab, type TAB twice, will get one TAB.
set shiftwidth=4	    " The number of spaces when auto-indent.
set expandtab		    " Use the spaces only.
set smarttab            " Insert appropriate spaces in front of line according to shiftwidth, tabstop, softtabstop.
set autoindent
set smartindent
"set cindent            " cindent will disable smartindent, but only for C-like programming.

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
