source ~/.dotfiles/.vim_config/sets.vim

call plug#begin('~/.vim/plugged')

" lexima replacement for deliMate
Plug 'cohama/lexima.vim'

" typescript
Plug 'leafgarland/typescript-vim'

" jsx indentation and highlight
Plug 'mxw/vim-jsx'

" highlight ending html tag when pointing to the start
Plug 'gregsexton/MatchTag'

"nerdtree.vim
Plug 'scrooloose/nerdtree'

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

" vim surround
Plug 'tpope/vim-surround'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" colors for vim
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'

call plug#end()

source ~/.dotfiles/.vim_config/general.vim
source ~/.dotfiles/.vim_config/style.vim
source ~/.dotfiles/.vim_config/plugin_settings.vim
source ~/.dotfiles/.vim_config/keymap.vim
let g:coc_global_extensions=['coc-tsserver', 'coc-flow', 'coc-css', 'coc-prettier', 'coc-yaml', 'coc-json', 'coc-html']
