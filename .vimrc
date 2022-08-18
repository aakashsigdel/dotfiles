source ~/.dotfiles/.vim_config/sets.vim

call plug#begin('~/.vim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'cohama/lexima.vim'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'gregsexton/MatchTag'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kkoomen/vim-doge'
Plug 'ryanoasis/vim-devicons'
Plug 'ludovicchabant/vim-gutentags'
Plug 'stevearc/vim-arduino'
Plug 'RRethy/nvim-treesitter-textsubjects'
Plug 'tpope/vim-repeat'
Plug 'ggandor/lightspeed.nvim'

" Telesope.vim
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'kyazdani42/nvim-web-devicons'

" colors for vim
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'mhartington/oceanic-next'
Plug 'overcache/NeoSolarized'

call plug#end()

source ~/.dotfiles/.vim_config/general.vim
source ~/.dotfiles/.vim_config/style.vim
source ~/.dotfiles/.vim_config/plugin_settings.vim
source ~/.dotfiles/.vim_config/keymap.vim
let g:coc_global_extensions=['coc-tsserver', 'coc-flow', 'coc-css', 'coc-prettier', 'coc-yaml', 'coc-json', 'coc-html']
:hi clear FgCocErrorFloatBgCocFloating
