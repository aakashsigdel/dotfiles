local utils = require('utils')
local actions = require('telescope.actions')
local telescope_actions = require("telescope.actions.set")

local fixfolds = {
   hidden = true,
   attach_mappings = function(_)
   telescope_actions.select:enhance({
      post = function()
      vim.cmd(":normal! zx")
      end,
   })
   return true
   end,
}

require('telescope').setup({
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
      },
      n = {
        ["<esc>"] = require('telescope.actions').close,
      },
    }
  },
  pickers = {
    buffers = utils.concat_tables({
      sort_lastused = true
    }, fixfolds),
    file_browser = fixfolds,
    find_files = fixfolds,
    git_files = fixfolds,
    grep_string = fixfolds,
    live_grep = fixfolds,
  }
})
