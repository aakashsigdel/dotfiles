local map = require('utils').map
local jester = require('jester')

local dir = vim.fn.expand('%:p')

-- remove the file name form the $file path and cd into that dir
cmd = "cd `sed 's/\\/[^/]*$//' <<< $file`" .. " && yarn jest --testPathPattern=$file -t '$result'"

jester.setup({
  cmd = cmd,
})

map('n', '<leader>jf', jester.run_file)
map('n', '<leader>jr', jester.run)
