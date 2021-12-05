" vim-jsx option to enable for js files too {{{
  let g:jsx_ext_required = 0
"}}}

" NerdTree settings {{{
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  let g:NERDTreeWinPos = "right"
"}}}

" fugitive.vim {{{
  set diffopt+=vertical
" }}}

" fzf rg {{{
  " --column: Show column number
  " --line-number: Show line number
  " --no-heading: Do not show file headings in results
  " --fixed-strings: Search term as a literal string
  " --ignore-case: Case insensitive search
  " --no-ignore: Do not respect .gitignore, etc...
  " --hidden: Search hidden files and folders
  " --follow: Follow symlinks
  " --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
  " --color: Search color options
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" }}}

" coc.nvim {{{
  " Use <leader>h to show documentation in preview window
  nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " snippets
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"}}}

" tree-sitter.nvim {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "html",
    "css",
    "yaml",
    "swift",
    "java",
    "bash",
    "json"
  }
}
EOF
"}}}

" vim-gutentags {{{
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*", "Pods", "ios", "android"]
let g:gutentags_cache_dir= "~/.cache/tags"
"}}}
