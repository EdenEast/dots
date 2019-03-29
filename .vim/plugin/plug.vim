" install vim-plug is missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autoload VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plug')

if has('nvim')
  " abstraction on top of neovim terminal
  Plug 'kassio/neoterm'

  " highlight yanked string
  Plug 'machakann/vim-highlightedyank'

  " Language Server Protocol (LSP) support for vim and neovim
  Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
  \ }
endif

" Asynchronously control git repositories in Neovim/Vim 8
Plug 'lambdalisue/gina.vim'

call plug#end()

