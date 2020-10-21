local use = require('packer').use

-- Pairs
-- use 'doums/coBra'
use 'jiangmiao/auto-pairs'

-- Enhanced search
use 'markonm/traces.vim'

-- Switch between single-line and multiline forms of code
use 'AndrewRadev/splitjoin.vim'

-- Better whitespace stripping for Vim
use {
  'thirtythreeforty/lessspace.vim',
  setup = function()
    vim.g.lessspace_normal = 0
  end
}

-- editorconfig integration
use {
  'editorconfig/editorconfig-vim',
  setup = function()
    vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*', 'scp://.*' }
  end
}

-- Min/Max buffer
use {
  'szw/vim-maximizer',
  startup = function() vim.g.maximizer_set_default_mapping = 0 end
}

-- change root
use {
  'airblade/vim-rooter',
  setup = function() vim.g.rooter_patterns = { '.git', '.git/', '.root', '.root/' } end
}
-- use {
--   'oberblastmeister/rooter.nvim',
--   config = function()
--     local rooter = require('rooter')
--
--     rooter.set_config({
--       echo = false,
--       cd_command = 'cd',
--       patterns = {
--         '.git',
--         '.root',
--       }
--     })
--     rooter.setup()
--   end
-- }

-- Integration with chrome/firefox with firenvim
use {
  'glacambre/firenvim',
  run = function() vim.fn['firevim#install'](0) end
}
