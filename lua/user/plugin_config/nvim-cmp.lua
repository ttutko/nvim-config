local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete()
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' }
  })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['omnisharp'].setup {
  capabilities = capabilities
}
