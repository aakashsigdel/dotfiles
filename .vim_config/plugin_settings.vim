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

" fzf settings {{{
"   " This is the default extra key bindings
"   let g:fzf_action = {
"     \ 'ctrl-t': 'tab split',
"     \ 'ctrl-x': 'split',
"     \ 'ctrl-v': 'vsplit' }
"
"   " In Neovim, you can set up fzf window using a Vim command
"   " let g:fzf_layout = { 'window': 'enew' }
"   " let g:fzf_layout = { 'window': '-tabnew' }
"   " let g:fzf_layout = { 'window': '10split enew' }
"
"   " Customize fzf colors to match your color scheme
"   let g:fzf_colors =
"   \ { 'fg':      ['fg', 'Normal'],
"     \ 'bg':      ['bg', 'Normal'],
"     \ 'hl':      ['fg', 'Comment'],
"     \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"     \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"     \ 'hl+':     ['fg', 'Statement'],
"     \ 'info':    ['fg', 'PreProc'],
"     \ 'border':  ['fg', 'Ignore'],
"     \ 'prompt':  ['fg', 'Conditional'],
"     \ 'pointer': ['fg', 'Exception'],
"     \ 'marker':  ['fg', 'Keyword'],
"     \ 'spinner': ['fg', 'Label'],
"     \ 'header':  ['fg', 'Comment'] }
"
"   " Enable per-command history.
"   " CTRL-N and CTRL-P will be automatically bound to next-history and
"   " previous-history instead of down and up. If you don't like the change,
"   " explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
"   let g:fzf_history_dir = '~/.local/share/fzf-history'
"   
"   " [Buffers] Jump to the existing window if possible
"   let g:fzf_buffers_jump = 1
"
"   " [[B]Commits] Customize the options used by 'git log':
"   let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
"
"   " Mapping selecting mappings
"   nmap <leader><tab> <plug>(fzf-maps-n)
"   xmap <leader><tab> <plug>(fzf-maps-x)
"   omap <leader><tab> <plug>(fzf-maps-o)
"   noremap <C-p> :FZF<CR>
" "}}}

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
