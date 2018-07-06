source ~/.dotfiles/.vim_config/sets.vim

" All Plugins {{{
" "========================================================
call plug#begin('~/.vim/plugged')

" lexima replacement for deliMate
Plug 'cohama/lexima.vim'

" typescript
" Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'

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

" ctrlP
Plug 'ctrlpvim/ctrlp.vim'

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

" vim-lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

" colors for vim
" Plug 'chriskempson/base16-vim'
" Plug 'nemesit/vim-colors-fukurokujopro'
" Plug 'altercation/vim-colors-solarized'
" Plug 'lifepillar/vim-solarized8'
" Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
" Plug 'kristijanhusak/vim-hybrid-material'
" Plug 'ajh17/Spacegray.vim'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'w0ng/vim-hybrid'
" Plug 'nightsense/vimspectr'
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
