" vim-jsx option to enable for js files too {{{
  let g:jsx_ext_required = 0
"}}}

" Emmet Options {{{
" Enabling just for html and css and js
  let g:user_emmet_install_global = 1
  autocmd FileType html,css,js EmmetInstall
"}}}

" NerdTree settings {{{
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"}}}

" fugitive.vim {{{
  set diffopt+=vertical
" }}}

" ale.vim {{{
  let g:ale_completion_max_suggestions = 3
  set completeopt=menu,menuone,noselect,noinsert
  let g:ale_linters = {'tsx': 'tsserver'}
  let g:ale_linter_aliases = {'tsx': ['ts', 'typescript'], 'typescriptreact': ['typescript']}
  let g:ale_linters = {
        \   'javascript': ['prettier', 'tsserver'],
        \   'javascript.jsx': ['prettier', 'tsserver'],
        \   'typescript': ['prettier', 'tsserver', 'tslint'],
        \   'typescriptreact': ['prettier', 'tsserver', 'tslint'],
        \   'typescript.tsx': ['prettier', 'tsserver', 'tslint'],
        \   'css': ['prettier'],
        \   'json': ['prettier'],
        \ }
  let g:ale_fixers = {
        \ 'javascript': ['prettier'],
        \ 'javascript.jsx': ['prettier'],
        \ 'typescript': ['prettier'],
        \ 'typescript.tsx': ['prettier'],
        \ 'typescriptreact': ['prettier'],
        \ }
  let g:ale_fix_on_save = 1
  let g:ale_javascript_prettier_use_local_config = 1
  let g:ale_typescript_prettier_use_local_config = 1
  let g:ale_sign_error = '✖'
  let g:ale_sign_warning = '⬥'
  let g:ale_sign_column_always = 1
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
  let g:fzf_layout = { 'down': '~30%'  }
" }}}
