" Install vim-plug if missing
if empty(glob('$HOME/.config/vim/autoload/plug.vim'))
  silent !mkdir -p "$HOME/.config/vim/autoload"
  silent !curl -fLo "$HOME/.config/vim/autoload/plug.vim" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME/.cache/vim/packages')
" If we are in vscode then it already has a lot of functionality
" that we dont need plugins to fill. In this case we are using neovim
" as just a modal editor
if exists('g:vscode')
" Editing: {{{
  " Plug 'jiangmiao/auto-pairs'
  " Plug 'junegunn/vim-easy-align'
  " Plug 'kana/vim-smartinput'
  " Plug 'terryma/vim-multiple-cursors'
  " Plug 'tpope/vim-repeat'
" }}}
" Text Objects: {{{
  Plug 'glts/vim-textobj-comment' " comment text object
  Plug 'kana/vim-textobj-user'    " define your own text objects
  Plug 'tpope/vim-surround'       " surround motion
  Plug 'wellle/targets.vim'       " additional text objects
" }}}
else
  " Autocomplete: {{{
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
    Plug 'Shougo/neco-syntax'
    Plug 'Shougo/neco-vim', { 'for': 'vim' }
    Plug 'racer-rust/vim-racer'
    Plug 'zchee/deoplete-zsh', {'for': ['zsh', 'bash', 'sh']}

    " For func argument completion
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'

    " include ctags for deoplete
    Plug 'Shougo/neoinclude.vim'
  endif
" }}}
" Editing: {{{
  Plug 'editorconfig/editorconfig-vim'
  Plug 'godlygeek/tabular'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/vim-easy-align'
  Plug 'kana/vim-smartinput'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
" }}}
" Languages: {{{
  Plug 'sheerun/vim-polyglot'
" }}}
" Productivity: {{{
  Plug 'jceb/vim-orgmode'
  Plug 'kien/ctrlp.vim'
  Plug 'w0rp/ale'
" }}}
" Text Objects: {{{
  Plug 'glts/vim-textobj-comment' " comment text object
  Plug 'kana/vim-textobj-user'    " define your own text objects
  Plug 'tpope/vim-surround'       " surround motion
  Plug 'wellle/targets.vim'       " additional text objects
" }}}
" Themes: {{{
  Plug 'CruizeMissile/Revolution.vim'
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'dylanaraps/wal.vim'
  Plug 'mhinz/vim-janah'
  Plug 'rhysd/vim-color-spring-night'
" }}}
" Misc: {{{
" Better whitespace stripping for vim
  Plug 'thirtythreeforty/lessspace.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'ciaranm/securemodelines'

  " fancy startup screen
  Plug 'mhinz/vim-startify'

  " hex colorize
  Plug 'chrisbra/Colorizer'

  if has('nvim')
    Plug 'kassio/neoterm'
  endif
endif
" }}}
call plug#end()

