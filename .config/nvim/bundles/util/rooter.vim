" Changes Vim working directory to project root (identified by presence of known directory or file)
Plug 'airblade/vim-rooter'

let g:rooter_patterns = ['.git', '.git/', '.root', '.root/', '.hg/', '.svn/']
