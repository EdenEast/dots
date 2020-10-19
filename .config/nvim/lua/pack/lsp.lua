local use = require('packer').use

-- Lsp configs
use {
  'neovim/nvim-lspconfig'
  config = function require'eden/lsp'.setup() end
}

-- Completion engine
use {
  'nvim-lua/completion-nvim',
  config = function()
    local completion = require('config')
  end
}




