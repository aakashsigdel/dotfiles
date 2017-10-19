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

" neoformat {{{
  augroup fmt
    autocmd!
    autocmd BufWritePre *.tsx undojoin | Neoformat
  augroup END
  let g:neoformat_typescript_prettier = {
              \ 'exe': 'prettier',
              \ 'args': ['--parser babylon', '--single-quote', '--trailing-comma none'],
              \ 'stdin': 1,
              \ }

  let g:neoformat_enabled_typescript = ['prettier']
"}}}

" prettier settings {{{
  " let g:prettier#exec_cmd_async = 1
  " let g:prettier#autoformat = 0
  " autocmd BufWritePre *.js,*.tsx,*.css,*.scss,*.less PrettierAsync
"}}}

" asyncompelete {{{
  set completeopt-=preview

  call asyncomplete#register_source(asyncomplete#sources#tscompletejob#get_source_options({
        \ 'name': 'tscompletejob',
        \ 'whitelist': ['typescript'],
        \ 'completor': function('asyncomplete#sources#tscompletejob#completor'),
        \ }))
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

  let g:asyncomplete_auto_popup = 0
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ asyncomplete#force_refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"}}}

" vim:foldmethod=marker:foldlevel=0
