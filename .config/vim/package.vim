" vim-plug install: {{{
" Check to see if vim-plug is installed. If not then curl it
if empty(glob('$HOME/.config/vim/autoload/plug.vim'))
  silent !mkdir -p "$HOME/.config/vim/autoload"
  silent !curl -fLo "$HOME/.config/vim/autoload/plug.vim" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}
" Plug list: {{{
call plug#begin('$HOME/.cache/vim/packages')
" Autocomplete: {{{
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " Language server client and completion engine
" }}}
" Editor Extension: {{{
  Plug 'AndrewRadev/splitjoin.vim'      " Split and join programming lines
  Plug 'Yggdroot/indentLine'            " display indentation lines
  Plug 'chrisbra/Colorizer'             " hex colorize
  Plug 'ciaranm/securemodelines'        " secure alternative to modelines
  Plug 'editorconfig/editorconfig-vim'  " vim respects .editorconfig files
  Plug 'kana/vim-smartinput'            " help autofil coding syntax like () && {}
  Plug 'mhinz/vim-startify'             " fancy startup screen
  Plug 'moll/vim-bbye'                  " helper around closing buffers
  Plug 'psliwka/vim-smoothie'           " Smooth scrolling
  Plug 'terryma/vim-multiple-cursors'   " ability to have multiple cursors
  Plug 'thirtythreeforty/lessspace.vim' " Better whitespace stripping for vim
" }}}
"Fuzzy: {{{
  " Install fzf into ~/.local/opt folder and install vim plugin
  Plug 'junegunn/fzf', {'dir': '~/.local/opt/fzf', 'do': './install --bin'}
  Plug 'junegunn/fzf.vim'
"}}}
" Gui Enhancements: {{{
  Plug 'itchyny/lightline.vim'          " status line
  Plug 'machakann/vim-highlightedyank'  " highlight yanked text
  Plug 'ryanoasis/vim-devicons'         " File type icons to Vim plugins
"}}}
" Navigation: {{{
  Plug 'airblade/vim-rooter'            " open vim at the root of a project
  Plug 'justinmk/vim-sneak'             " Jump to any location specified by two characters
" }}}
" Languages: {{{
  Plug 'jceb/vim-orgmode'               " emacs' org-mode support
  Plug 'sheerun/vim-polyglot'           " Install support for most languages
  Plug 'vmchale/just-vim'               " Justfile syntax
" }}}
" Themes: {{{
  Plug 'CruizeMissile/Revolution.vim'
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'artanikin/vim-synthwave84'
  Plug 'dylanaraps/wal.vim'
  Plug 'flrnd/candid.vim'
  Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
  Plug 'mhinz/vim-janah'
  Plug 'rhysd/vim-color-spring-night'
" }}}
" Vim Language: {{{
" Actions: {{{
  Plug 'tpope/vim-repeat'               " make . support plugins
" }}}
" Motions: {{{
  Plug 'junegunn/vim-easy-align'        " alignment motions
  Plug 'machakann/vim-sandwich'         " Search/select/edit sandwiched textobjects (surrond)
  Plug 'tpope/vim-commentary'           " language agnostic comment motions
  Plug 'christoomey/vim-sort-motion'    " Sort motion
" }}}
" Text Objects: {{{
  Plug 'glts/vim-textobj-comment'       " comment text object
  Plug 'kana/vim-textobj-function'      " text object for functions
  Plug 'kana/vim-textobj-user'          " define your own text objects
  Plug 'wellle/line-targets.vim'        " line text objects ci-
  Plug 'wellle/targets.vim'             " additional text objects
" }}}
" Neovim: {{{
  if has('nvim')
    " Only neovim has a built in terminal so if we are in neovim
    " then install terminal plugin
    Plug 'kassio/neoterm'
  endif
" }}}
" Local Packages: {{{
if filereadable(expand('$HOME/.local/etc/vim/package.vim'))
  source $HOME/.local/etc/vim/package.vim
endif
" }}}
" }}}
" Window And Splits: {{{

" }}}
call plug#end()
" }}}
" Automacgic {{{
" Automagicly install missing plugins on startup
augroup Plug
  autocmd!
  autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | q
    \| endif
augroup END
" }}}
