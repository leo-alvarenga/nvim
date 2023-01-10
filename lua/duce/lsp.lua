local lsp = require('lsp-zero')
local cmp = require('cmp')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'gopls',
  'sumneko_lua'
})

local cmp_sel = { behavior = cmp.SelectBehavior.Select }
local cmp_map = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_sel),
  ['<C-p>'] = cmp.mapping.select_next_item(cmp_sel),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({ mapping = cmp_map })

lsp.setup()

