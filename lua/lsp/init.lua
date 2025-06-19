local Lsp = {}

Lsp.lazydev = require('lsp.lazydev_config')
Lsp.lspconfig = require('lsp.lspconfig_config')
Lsp.conform = require('lsp.conform_config')
Lsp.blink = require('lsp.blink_config')
Lsp.nvimlint = require('lsp.nvim_lint_config')
Lsp.treesitter = require('lsp.treesitter_config')

return Lsp
