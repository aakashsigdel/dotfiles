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

" tsuquyomi.vim {{{
  let g:tsuquyomi_disable_quickfix=1
" }}}

" ale.vim {{{
  let g:ale_fixers = {
        \ 'javascript': ['prettier'],
        \ 'typescript': ['prettier']
        \ }
  let g:ale_fix_on_save = 1
  let g:ale_sign_column_always = 1
" }}}

" deolete.vim {{{
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#max_list = 10
  let g:deoplete#max_abbr_width = 35
  let g:deoplete#max_menu_width = 20
  let g:deoplete#skip_chars = ['(', ')', '<', '>']
  let g:deoplete#tag#cache_limit_size = 800000
  let g:deoplete#file#enable_buffer_path = 1
  set completeopt-=preview

  " <Tab> completion:
  " 1. If popup menu is visible, select and insert next item
  " 2. Otherwise, if within a snippet, jump to next input
  " 3. Otherwise, if preceding chars are whitespace, insert tab char
  " 4. Otherwise, start manual autocomplete
  imap <silent><expr><Tab> pumvisible() ? "\<Down>"
        \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
        \ : (<SID>is_whitespace() ? "\<Tab>"
        \ : deoplete#manual_complete()))

  smap <silent><expr><Tab> pumvisible() ? "\<Down>"
        \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
        \ : (<SID>is_whitespace() ? "\<Tab>"
        \ : deoplete#manual_complete()))

  inoremap <expr><S-Tab>  pumvisible() ? "\<Up>" : "\<C-h>"

  function! s:is_whitespace() "{{{
    let col = col('.') - 1
    return ! col || getline('.')[col - 1] =~? '\s'
  endfunction

" }}}

" vim:foldmethod=marker:foldlevel=0
