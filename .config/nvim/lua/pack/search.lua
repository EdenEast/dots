local use = require('packer').use

use {
  'junegunn/fzf.vim',
  requires = {
    'junegunn/fzf',
    run = function() vim.fn['fzf#install()']() end,
  },
}
