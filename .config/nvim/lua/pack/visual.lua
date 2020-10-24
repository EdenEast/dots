local use = require('packer').use

-- Themes
use 'arzg/vim-colors-xcode'
use 'sainnhe/gruvbox-material'

use 'Yggdroot/indentLine'
use {'liuchengxu/vim-which-key', cmd = 'WhichKey'}

-- Start page
use {
  'glepnir/dashboard-nvim',
  config = function() require'eden/dashboard'.setup() end,
  disable = true,
}
use {
  'mhinz/vim-startify',
}

-- Status line
use {
  'itchyny/lightline.vim',
  config = function() require'eden/lightline'.setup() end,
}

