local builtin = require('telescope.builtin')
local utils = require('utils')
local typescript = require('typescript')
local extend = utils.extend

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local rounded_border = {border = 'rounded'}

local goto_next = function(severity)
  local options = extend({ float = rounded_border}, {severity = severity})
  return function (opts)
    return vim.diagnostic.goto_next(extend(options, opts))
  end
end

local goto_prev = function(severity)
  local options = extend({ float = rounded_border}, {severity = severity})
  return function (opts)
    return vim.diagnostic.goto_prev(extend(options, opts))
  end
end

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, rounded_border)

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>k', goto_prev(vim.diagnostic.severity.ERROR), opts)
vim.keymap.set('n', '<leader>j', goto_next(vim.diagnostic.severity.ERROR), opts)
vim.keymap.set('n', '<leader>wk', goto_prev({max = vim.diagnostic.severity.WARN}), opts)
vim.keymap.set('n', '<leader>wj', goto_next({max = vim.diagnostic.severity.WARN}), opts)

local on_attach = function(_, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
end

local on_attach_ts = function(_, bufnr)
  on_attach(_, bufnr)

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<leader>trf', '<cmd>TypescriptRenameFile<cr>', bufopts)
  vim.keymap.set('n', '<leader>tgs', '<cmd>TypescriptGoToSourceDefinition<cr>', bufopts)
  vim.keymap.set('n', '<leader>tai', typescript.actions.addMissingImports, extend(bufopts, {desc = 'Add missing imports'}))
  vim.keymap.set('n', '<leader>toi', typescript.actions.organizeImports, extend(bufopts, {desc = 'Organize imports'}))
  vim.keymap.set('n', '<leader>tui', typescript.actions.removeUnused, extend(bufopts, {desc = 'Remove unused imports'}))
end

require("typescript").setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach_ts
  }
})

require'lspconfig'.eslint.setup{}

require'lspconfig'.lua_ls.setup {
  server = {
    capabilities = capabilities,
    on_attach = on_attach
  },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = {'vim'} },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
}

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

require'cmp'.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = require'cmp'.config.window.bordered(),
    documentation = require'cmp'.config.window.bordered(),
  },
  mapping = require'cmp'.mapping.preset.insert({
    ['<C-d>'] = require'cmp'.mapping.scroll_docs(-4),
    ['<C-f>'] = require'cmp'.mapping.scroll_docs(4),
    ['<CR>'] = require'cmp'.mapping.confirm({ select = true }),
  }),
  sources = require'cmp'.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = require'lspkind'.cmp_format()
  }
})

require'cmp'.setup.filetype('gitcommit', {
  sources = require'cmp'.config.sources({
    { name = 'cmp_git' },
  }, {
    { name = 'buffer' },
  })
})

