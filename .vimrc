source ~/.dotfiles/.vim_config/sets.vim

let g:ale_virtualtext_cursor = 1
let g:ale_completion_enabled = 1

" All Plugins {{{
" "========================================================
call plug#begin('~/.vim/plugged')

" lexima replacement for deliMate
Plug 'cohama/lexima.vim'

" typescript
Plug 'leafgarland/typescript-vim'

" lightline
Plug 'itchyny/lightline.vim'

" jsx indentation and highlight
Plug 'mxw/vim-jsx'

" highlight ending html tag when pointing to the start
Plug 'gregsexton/MatchTag'

" NerdTree Plug
Plug 'scrooloose/nerdtree'

" Emmet for vim
Plug 'mattn/emmet-vim'

" Seamless switch between vim and tmux splits
Plug 'christoomey/vim-tmux-navigator'

" fugitive
Plug 'tpope/vim-fugitive'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Ag for vim
Plug 'rking/ag.vim'

" tcomment for vim
Plug 'tomtom/tcomment_vim'

" matchit
Plug 'tmhedberg/matchit'

" vim surround
Plug 'tpope/vim-surround'

" vim ale
Plug 'w0rp/ale'

" Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" colors for vim
Plug 'morhetz/gruvbox'

" --------------------------------------------------------------
call plug#end()
filetype plugin indent on    " required
filetype on
" ==============================================================

"}}}

source ~/.dotfiles/.vim_config/general.vim
source ~/.dotfiles/.vim_config/style.vim
source ~/.dotfiles/.vim_config/plugin_settings.vim
source ~/.dotfiles/.vim_config/keymap.vim

" vim:foldmethod=marker:foldlevel=0
