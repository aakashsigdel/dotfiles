vim.fn.sign_define("DiagnosticSignError",
  {text = "x ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
  {text = "w ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
  {text = "i ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
  {text = "h", texthl = "DiagnosticSignHint"})

require("neo-tree").setup({
  filesystem = {
    window = {
      mappings = {
        -- disable fuzzy finder 
        ["/"] = "noop"
      }
    }
  },
  default_component_configs = {
    git_status = {
      symbols = {
        -- Change type
        added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified  = "•", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted   = "✖",-- this can only be used in the git_status source
        renamed   = "🡺",-- this can only be used in the git_status source
        -- Status type
        untracked = "?",
        ignored   = "☒",
        unstaged  = "☐",
        staged    = "☑",
        conflict  = "",
      }
    }
  }
})
