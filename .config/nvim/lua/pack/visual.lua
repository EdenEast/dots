local use = require('packer').use

use 'arzg/vim-colors-xcode'
use 'sainnhe/gruvbox-material'

use 'Yggdroot/indentLine'
use 'mhinz/vim-startify'
use {'liuchengxu/vim-which-key', cmd = 'WhichKey'}

use {
  'itchyny/lightline.vim',
  config = function() require'eden/lightline'.setup() end,
}

