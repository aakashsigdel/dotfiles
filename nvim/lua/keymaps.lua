local map = require('utils').map

map('n', '<leader>n', ':nohlsearch<CR>')
map('n', '<space>', 'za')
map('n', 'gp', '`[v`]')
map('n', '<leader><space>', ':b#<CR>')
map('n', '<leader>a<CR>', ':bufdo bw<CR>', {silent = true})
map('n', '<F5>', ':source $MYVIMRC<CR>')

map('n', '<leader><CR>', ':Neotree toggle<CR>', {silent = true})
map('n', '<leader>q', ':Neotree current reveal left<CR>', {silent = true})

map('n', '<c-p>', '<cmd>Telescope find_files<cr>')
map('n', '<c-b>', '<cmd>Telescope buffers<cr>')
map('n', '<leader>f', '<cmd>Telescope live_grep<cr>')

map('n', '<leader>gs', ':Gstatus<CR>')
