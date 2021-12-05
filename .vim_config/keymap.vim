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

" FZF mapings
map <c-p> :Files<CR>
map <c-b> :Buffers<CR>
map <c-g><c-s> :GFiles?<CR>
map <c-g><c-h> :BCommits<CR>
map <c-i> :BLines<CR>
map <c-t> :BTags<CR>

noremap <silent> <leader>a<CR> :bufdo bw<CR>

" coc.nvim
" ==============
" gotos
nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> <leader>t <Plug>(coc-type-definition)
nmap <silent> <leader>i <Plug>(coc-implementation)
nmap <silent> <leader>r <Plug>(coc-references)
nmap <silent> <leader>j <Plug>(coc-diagnostic-next-error)
nmap <silent> <leader>k <Plug>(coc-diagnostic-prev-error)

" scroll float popup
noremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"

" code actions
command! -nargs=? Fix     :call CocActionAsync('codeAction', '')
nmap <silent> <leader>ca :Fix<CR>
nmap <silent> <leader>as  <Plug>(coc-codeaction-selected)
nmap <leader>af <Plug>(coc-fix-current)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

