" vim-jsx option to enable for js files too {{{
  let g:jsx_ext_required = 0
"}}}

" Emmet Options {{{
" Enabling just for html and css
  let g:user_emmet_install_global = 1
  autocmd FileType html,css,js EmmetInstall
"}}}

"CtrlP settings {{{
  if exists("g:ctrlp_user_command")
    unlet g:ctrlp_user_command
  endif
  if executable('ag')
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command =
      \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  else
    " Fall back to using git ls-files if Ag is not available
    let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
  endif

  " Default to filename searches - so that appctrl will find application
  " controller
  "let g:ctrlp_by_filename = 1

  " Don't jump to already open window. This is annoying if you are maintaining
  " several Tab workspaces and want to open two windows into the same file.
  let g:ctrlp_switch_buffer = 0

  " find in buffer mapping
  map <c-b> :CtrlPBuffer<CR>
"}}}

" NerdTree settings {{{
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"}}}

" fugitive.vim {{{
  set diffopt+=vertical
" }}}

" language-servers {{{
  if executable('typescript-language-server')
      au User lsp_setup call lsp#register_server({
          \ 'name': 'typescript-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
          \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
          \ 'whitelist': ['typescript'],
          \ })
  endif

  if executable('css-languageserver')
      au User lsp_setup call lsp#register_server({
          \ 'name': 'css-languageserver',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
          \ 'whitelist': ['css', 'less', 'sass'],
          \ })
  endif
" }}}

" ale.vim {{{
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
        \ 'typescript': ['prettier']
        \ }
  let g:ale_fix_on_save = 1
  let g:ale_sign_column_always = 1
  let g:ale_javascript_prettier_use_local_config = 1
  let g:ale_typescript_prettier_use_local_config = 1
  let g:ale_sign_error = '✖'
  let g:ale_sign_warning = '⬥'
" }}}
