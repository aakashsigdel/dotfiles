" turn off searh highlight
nnoremap <leader>n :nohlsearch<CR>

" spaec open/closes fold
nnoremap <space> za

" buffer mapings
" mappings for vertical split increment by 5 units
nnoremap + :exe "vertical resize " . (winwidth(0) * 9/8)<CR>
nnoremap _ :exe "vertical resize " . (-5)<CR>

" map :b# to <leader><space>
nmap <leader><space> :b#<CR>

" last pasted text
nnoremap gp `[v`]

" source vimrc
noremap <F5> :source $MYVIMRC<CR>

" nerdtree mapping
map <leader><CR> :NERDTreeToggle<CR>
map <leader>q :NERDTreeFind<CR>

" Fugitive mapping
" map Gstatus
noremap <leader>gs :Gstatus<CR>

" fix for iterm under mac
nnoremap <BS> :TmuxNavigateLeft<CR>

" ale
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)
nmap <silent> <leader>d <Plug>(ale_detail)
nnoremap <leader>h :ALEHover<CR>
" nnoremap <F2> :LspRename<CR>
nnoremap <leader>r :ALEFindReferences<CR>
nnoremap <C-]> :ALEGoToDefinition<CR>

" FZF mapings
map <c-p> :Files<CR>
map <c-b> :Buffers<CR>
