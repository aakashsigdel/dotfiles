" vim-jsx option to enable for js files too
  let g:jsx_ext_required = 0

" neo tree
lua << EOF
require("neo-tree").setup({
        close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        default_component_configs = {
          container = {
            enable_character_fade = true
          },
          modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
          },
          name = {
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },
          git_status = {
            symbols = {
              -- Change type
              deleted   = "✖",-- this can only be used in the git_status source
              renamed   = "",-- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored   = "",
              unstaged  = "",
              staged    = "",
              conflict  = "",
            }
          },
        },
        filesystem = {
          filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = true,
            hide_gitignored = false,
          },
        },
      })
EOF

" fugitive.vim
  set diffopt+=vertical

" fzf rg
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }

" telescope.nvim
lua << EOF
local actions = require('telescope.actions')
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
    buffers = {
      sort_lastused = true
    }
  }
})
EOF

" coc.nvim
  let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-html', 'coc-css', 'coc-json', 'coc-prettier', 'coc-svg', 'coc-tsserver', 'coc-yaml', 'coc-marketplace', 'coc-eslint', 'coc-diagnostic']
  " Use <leader>h to show documentation in preview window
  nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " snippets
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" tree-sitter.nvim
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "html",
    "css",
    "yaml",
    "swift",
    "java",
    "bash",
    "json"
  },
  textsubjects = {
    enable = true,
    prev_selection = ',', -- (Optional) keymap to select the previous selection
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-outer',
      ['i;'] = 'textsubjects-container-inner',
    },
  }
}
EOF

" vim-gutentags
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = [
    \ '--tag-relative=yes',
    \ '--fields=+ailmnS',
    \ ]
    " \ '--options=./plugged/ctags-patterns-for-javascript/ctagsrc',
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

let g:gutentags_ctags_exclude = [
    \ '*.git', '*.svg', '*.hg',
    \ '*/tests/*',
    \ 'build',
    \ 'dist',
    \ '*sites/*/files/*',
    \ 'bin',
    \ 'node_modules',
    \ 'bower_components',
    \ 'cache',
    \ 'compiled',
    \ 'docs',
    \ 'example',
    \ 'bundle',
    \ 'vendor',
    \ '*.md',
    \ '*-lock.json',
    \ '*.lock',
    \ '*bundle*.js',
    \ '*build*.js',
    \ '.*rc*',
    \ '*.json',
    \ '*.min.*',
    \ '*.map',
    \ '*.bak',
    \ '*.zip',
    \ '*.pyc',
    \ '*.class',
    \ '*.sln',
    \ '*.Master',
    \ '*.csproj',
    \ '*.tmp',
    \ '*.csproj.user',
    \ '*.cache',
    \ '*.pdb',
    \ 'tags*',
    \ 'cscope.*',
    \ '*.css',
    \ '*.less',
    \ '*.scss',
    \ '*.exe', '*.dll',
    \ '*.mp3', '*.ogg', '*.flac',
    \ '*.swp', '*.swo',
    \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
    \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
    \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
    \ 'ios',
    \ 'android'
    \ ]
