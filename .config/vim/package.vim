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
  Plug 'Yggdroot/indentLine'            " Display indentation lines
  Plug 'chrisbra/Colorizer'             " Hex colorize
  Plug 'ciaranm/securemodelines'        " Secure alternative to modelines
  Plug 'editorconfig/editorconfig-vim'  " Vim respects .editorconfig files
  Plug 'kana/vim-smartinput'            " Help autofil coding syntax like () && {}
  Plug 'mhinz/vim-startify'             " Fancy startup screen
  Plug 'moll/vim-bbye'                  " Helper around closing buffers
  Plug 'psliwka/vim-smoothie'           " Smooth scrolling
  Plug 'terryma/vim-multiple-cursors'   " Ability to have multiple cursors
  Plug 'thirtythreeforty/lessspace.vim' " Better whitespace stripping for vim
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" }}}
"Fuzzy: {{{
  " Install fzf into ~/.local/opt folder and install vim plugin
  Plug 'junegunn/fzf', {'dir': '~/.local/opt/fzf', 'do': './install --bin'}
  Plug 'junegunn/fzf.vim'
"}}}
" Gui Enhancements: {{{
  Plug 'itchyny/lightline.vim'          " Status line
  Plug 'machakann/vim-highlightedyank'  " Highlight yanked text
  Plug 'ryanoasis/vim-devicons'         " File type icons to Vim plugins
"}}}
" Navigation: {{{
  Plug 'airblade/vim-rooter'            " Open vim at the root of a project
  Plug 'justinmk/vim-sneak'             " Jump to any location specified by two characters
" }}}
" Languages: {{{
  Plug 'jceb/vim-orgmode'               " Emacs' org-mode support
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
  Plug 'tpope/vim-repeat'               " Make . support plugins
" }}}
" Motions: {{{
  Plug 'junegunn/vim-easy-align'        " Alignment motions
  Plug 'machakann/vim-sandwich'         " Search/select/edit sandwiched textobjects (surrond)
  Plug 'tpope/vim-commentary'           " Language agnostic comment motions
  Plug 'christoomey/vim-sort-motion'    " Sort motion
  Plug 'christoomey/vim-system-copy'    " Copying to the system clipboard with text-objects and motions
" }}}
" Text Objects: {{{
  Plug 'glts/vim-textobj-comment'       " Comment text object
  Plug 'kana/vim-textobj-function'      " Text object for functions
  Plug 'kana/vim-textobj-user'          " Define your own text objects
  Plug 'wellle/line-targets.vim'        " Line text objects ci-
  Plug 'wellle/targets.vim'             " Additional text objects
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
