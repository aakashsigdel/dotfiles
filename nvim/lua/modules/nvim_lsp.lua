local builtin = require('telescope.builtin')
local utils = require('utils')
local typescript = require('typescript')
local extend = utils.extend
-- local coq = require('coq')

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local capabilities = vim.lsp.protocol.make_client_capabilities()

local goto_next = function(severity)
  return function (opts)
    return severity == nil
      and vim.diagnostic.goto_next(opts)
      or vim.diagnostic.goto_next(extend({severity = severity}, opts))
  end
end

local goto_prev = function(severity)
  return function (opts)
    return severity == nil
      and vim.diagnostic.goto_prev(opts)
      or vim.diagnostic.goto_prev(extend({severity = severity}, opts))
  end
end

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>k', goto_prev(vim.diagnostic.severity.ERROR), opts)
vim.keymap.set('n', '<leader>j', goto_next(vim.diagnostic.severity.ERROR), opts)
vim.keymap.set('n', '<leader>wk', goto_prev(vim.diagnostic.severity.HINT), opts)
vim.keymap.set('n', '<leader>wj', goto_next(vim.diagnostic.severity.HINT), opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function(_, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
  vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation, bufopts)
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
