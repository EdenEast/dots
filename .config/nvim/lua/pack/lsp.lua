local use = require('packer').use

-- Lsp configs
use {
  'neovim/nvim-lspconfig',
  config = function() require'eden/lsp'.setup() end,
  requires = {
    'nvim-lua/completion-nvim',
    'nvim-lua/diagnostic-nvim',
    'nvim-lua/lsp-status.nvim',
    'tjdevries/lsp_extensions.nvim',
  }
}

