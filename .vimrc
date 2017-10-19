source ~/.dotfiles/.vim_config/sets.vim
source ~/.dotfiles/.vim_config/keymap.vim

" All Plugins {{{
" "========================================================
call plug#begin('~/.vim/plugged')

" lexima replacement for deliMate
Plug 'cohama/lexima.vim'

" javascript Plugs
" Plug 'pangloss/vim-javascript'
" Plug 'othree/yajs.vim'

" auto complete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'runoshun/tscompletejob'
Plug 'prabirshrestha/asyncomplete-tscompletejob.vim'

" typescript
" Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'

" jsx indentation and highlight
Plug 'mxw/vim-jsx'

" plugin for prettier js
Plug 'sbdchd/neoformat'
" Plug 'prettier/vim-prettier', {
"     \ 'do': 'npm install',
"     \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }

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

" ctrlP
Plug 'ctrlpvim/ctrlp.vim'

" Ag for vim
Plug 'rking/ag.vim'

" tcomment for vim
Plug 'tomtom/tcomment_vim'

" smooth scroll Plug
Plug 'terryma/vim-smooth-scroll'

" matchit
Plug 'tmhedberg/matchit'

" vim surround
Plug 'tpope/vim-surround'

" vim-xcode
Plug 'gfontenot/vim-xcode'

" colors for vim
Plug 'chriskempson/base16-vim'
Plug 'nemesit/vim-colors-fukurokujopro'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'ajh17/Spacegray.vim'
Plug 'NLKNguyen/papercolor-theme'

" --------------------------------------------------------------
call plug#end()
filetype plugin indent on    " required
filetype on
" ==============================================================

"}}}

source ~/.dotfiles/.vim_config/general.vim
source ~/.dotfiles/.vim_config/style.vim
source ~/.dotfiles/.vim_config/plugin_settings.vim

" vim:foldmethod=marker:foldlevel=0
