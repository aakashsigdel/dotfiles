let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" mode line tells vim to set for this file only
" and equals to 1 tells vim to check last line for the settings
set modelines=1
set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
set laststatus=2
set hidden

" set line number as relative as well as absolute
set nu
set rnu

" set undofile for undo persistance when navigating between buffers
set undofile
set undodir=$HOME/.vim/undo

" set right side column
set colorcolumn=100

" leader is comma
let mapleader=","

" set tab length to 2 columns
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Always indent/outdent to nearest tabstop
set shiftround

" Indent to correct location with tab
set smarttab

" copy the indentation of previous line if autoindent doesn't know what to do
set copyindent

" indent as file type
filetype plugin indent on

" enable search Highlighting
set hlsearch

" highlight currentline
set cursorline

" visual autocomplete for command menu
set wildmenu

" redraw only when needed; makes vim faster
set lazyredraw

" open all folds on start
set foldlevelstart=99

" speedup syntax highlighting
set nocursorcolumn
set nocursorline
" scan min lines for highlight
syntax sync minlines=100
" scan max lines for highlight 
syntax sync maxlines=240
" don't highlight lines longer than 800 chars
set synmaxcol=900

" set fold method to indent *fdm=syntax makes vim slow
set fdm=indent
set foldlevel=0

" set case insensitive search
set ignorecase
set smartcase

" set sane timeouts
set timeoutlen=1000 ttimeoutlen=0

" spell check
setlocal spell spelllang=en_us

" assume the /g flag on :s substitutions to replace all matches in a line
set gdefault

" set trail to tabs
set list listchars=tab:»·,trail:·

" disable mouse
set mouse=

" disable swp files
set noswapfile

" incremental search (search as you type)
set incsearch

" for some wierd reason key I type is being shwon in status bar
" this is for disable that
set noshowcmd
