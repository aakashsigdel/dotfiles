local utils = require('utils')
local telescope_actions = require('telescope.actions.set')
local action_layout = require("telescope.actions.layout")

pcall(require('telescope').load_extension, 'fzf')

local fixfolds = {
   hidden = true,
   attach_mappings = function(_)
   telescope_actions.select:enhance({
      post = function()
      vim.cmd(':normal! zx')
      end,
   })
   return true
   end,
}

require("telescope").setup({
  defaults = {
    file_ignore_patterns = {'.vscode', '.idea', '.git'},
    mappings = {
      i = {
        ['<esc>'] = require('telescope.actions').close,
        ['<leader>?'] = action_layout.toggle_preview,
      },
      n = {
        ['<esc>'] = require('telescope.actions').close,
      },
    }
  },
  pickers = {
    buffers = utils.extend({
      sort_lastused = true,
      previewer = false,
    }, fixfolds),
    file_browser = fixfolds,
    find_files = utils.extend({previewer = false}, fixfolds),
    git_files = fixfolds,
    grep_string = fixfolds,
    live_grep = utils.extend(fixfolds, {additional_args = function(opts) return {"--hidden"} end}),
  }
})

require("telescope").load_extension("ui-select")
require('telescope').load_extension('env')
