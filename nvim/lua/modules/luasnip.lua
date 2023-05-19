local ls = require'luasnip'
local types = require'luasnip.util.types'

ls.config.set_config {
  updateevents = 'TextChanged, TextChangedI',
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { '', 'Error' } }
      }
    }
  }
}

vim.keymap.set({'i', 's'}, '<c-v>', function ()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, {silent = true})

vim.keymap.set({'i', 's'}, '<c-k>', function ()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, {silent = true})

vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~/.dotfiles/nvim/lua/modules/luasnip.lua<CR>')

ls.snippets = {
  all = {
    ls.parser.parse_snippet('expand', '-- this is a crazy one')
  }
}
