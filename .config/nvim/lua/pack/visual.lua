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
  -- vim.g.lightline = {
  --   colorscheme = 'wombat',
  --   active = {
  --     left = {
  --       {'mode', 'paste', 'modified'},
  --       {'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified'}
  --     },
  --     right = {
  --       {'lineinfo'},
  --       {'lspstatus', 'cocstatus', 'percent', 'filetype'}
  --     }
  --   },
  --   component = {
  --     lineinfo = ' %3l:%-2v',
  --   },
  --   component_type = {
  --     readonly = 'error',
  --     linter_warnings = 'warning',
  --     linter_errors = 'error',
  --   },
  --   component_function = {
  --     gitbranch = 'FugitiveHead',
  --     cocstatus = 'coc#status',
  --   }
  -- }


