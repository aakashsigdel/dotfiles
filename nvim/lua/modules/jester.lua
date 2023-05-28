local map = require('utils').map
local jester = require('jester')

-- remove the file name form the $file path and cd into that dir; then cut the extension from file name before running test
cmd_run_file = "cd `sed 's/\\/[^/]*$//' <<< $file`" .. " && yarn jest `echo $file | cut -f 1 -d '.'`"
cmd_run = cmd_run_file .. " -t '$result'"
cmd_watch = cmd_run_file .. ' --watch'

map('n', '<leader>jf', function() jester.run_file({cmd = cmd_run_file}) end)
map('n', '<leader>jr', function() jester.run({cmd = cmd_run}) end)
map('n', '<leader>jw', function() jester.run_file({ cmd = cmd_watch }) end)
map('n', '<leader>jt', function() jester.terminate() end)
