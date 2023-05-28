vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
return require('packer').startup(
  function(use)
    use 'wbthomason/packer.nvim'

    -- mason
    use {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig'
    }

    -- bufferline
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

    -- dap
    use 'mfussenegger/nvim-dap'

    -- lua
    use 'folke/neodev.nvim'

    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'onsails/lspkind-nvim'
    use 'jose-elias-alvarez/typescript.nvim'

    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use "rafamadriz/friendly-snippets"

    use 'euclidianAce/BetterLua.vim'
    use 'leafgarland/typescript-vim'
    use 'maxmellon/vim-jsx-pretty'
    use 'gregsexton/MatchTag'
    use 'christoomey/vim-tmux-navigator'
    use 'tpope/vim-fugitive'
    use 'rking/ag.vim'
    use 'tpope/vim-surround'
    use 'kkoomen/vim-doge'
    use 'ryanoasis/vim-devicons'
    use 'tpope/vim-repeat'
    use 'ggandor/lightspeed.nvim'
    use 'vimwiki/vimwiki'
    use 'echasnovski/mini.pairs'
    use 'rcarriga/nvim-notify'
    use {
      'akinsho/git-conflict.nvim',
      tag = "*",
      config = function()
        require('git-conflict').setup()
      end
    }
    use {
      'prettier/vim-prettier',
      run = 'yarn install --frozen-lockfile --production',
      ft = {
        'javascript',
        'typescript',
        'typescriptreact',
        'javascriptreact',
        'css',
        'less',
        'scss',
        'json',
        'graphql',
        'markdown',
        'vue',
        'svelte',
        'yaml',
        'html'
      }
    }

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'RRethy/nvim-treesitter-textsubjects'
    use 'nvim-treesitter/playground'

    -- Telesope.nvim
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- Jester
    use 'David-Kunz/jester'

    -- Comment.nvim
    use 'numToStr/Comment.nvim'
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use {
      "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons",
          "MunifTanjim/nui.nvim",
        },
        config = function()
        end
      }

    use ({
      'RRethy/nvim-base16',
      config = function()
        vim.cmd([[
          colorscheme base16-one-light
          set background=light
        ]])
      end
    })
  end
)
