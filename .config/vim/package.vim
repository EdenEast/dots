" Install vim-plug if missing
if empty(glob('$HOME/.config/vim/autoload/plug.vim'))
  silent !mkdir -p "$HOME/.config/vim/autoload"
  silent !curl -fLo "$HOME/.config/vim/autoload/plug.vim" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME/.cache/vim/packages')
" Autocomplete: {{{
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " Language server client and completion engine
" }}}
" Editing: {{{
  " Plug 'jiangmiao/auto-pairs'       " autofil () && {}
  Plug 'AndrewRadev/splitjoin.vim'     " Split and join programming lines
  Plug 'airblade/vim-rooter'           " open vim at the root of a project
  Plug 'editorconfig/editorconfig-vim' " vim respects .editorconfig files
  Plug 'junegunn/vim-easy-align'       " alignment motions
  Plug 'justinmk/vim-sneak'            " Jump to any location specified by two characters
  Plug 'kana/vim-smartinput'           " help autofil coding syntax like () && {}
  Plug 'terryma/vim-multiple-cursors'  " ability to have multiple cursors
  Plug 'tpope/vim-commentary'          " language agnostic comment motions
  Plug 'tpope/vim-repeat'              " make . support plugins
" }}}
"Fuzzy {{{
  " Install fzf into ~/.local/opt folder and install vim plugin
  Plug 'junegunn/fzf', {'dir': '~/.local/opt/fzf', 'do': './install --bin'}
  Plug 'junegunn/fzf.vim'
"}}}
" Gui Enhancements: {{{
  Plug 'itchyny/lightline.vim'         " status line
  Plug 'machakann/vim-highlightedyank' " highlight yanked text
"}}}
" Languages: {{{
  Plug 'sheerun/vim-polyglot'          " Install support for most languages
  Plug 'vmchale/just-vim'              " Justfile syntax
" }}}
" Productivity: {{{
  Plug 'jceb/vim-orgmode'              " emacs' org-mode support
" }}}
" Text Objects: {{{
  Plug 'glts/vim-textobj-comment'     " comment text object
  Plug 'kana/vim-textobj-user'        " define your own text objects
  " Plug 'machakann/vim-sandwich'       " search/select/edit sandwiched textobjects
  Plug 'wellle/targets.vim'           " additional text objects
  Plug 'kana/vim-textobj-function'    " text object for functions
  Plug 'wellle/line-targets.vim'      " line text objects ci-
" }}}
" Themes: {{{
  Plug 'CruizeMissile/Revolution.vim'
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'dylanaraps/wal.vim'
  Plug 'mhinz/vim-janah'
  Plug 'rhysd/vim-color-spring-night'
  Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
  Plug 'artanikin/vim-synthwave84'
  Plug 'flrnd/candid.vim'
" }}}
" Misc: {{{
  Plug 'psliwka/vim-smoothie'           " Smooth scrolling
  Plug 'thirtythreeforty/lessspace.vim' " Better whitespace stripping for vim
  Plug 'Yggdroot/indentLine'            " display indentation lines
  Plug 'ciaranm/securemodelines'        " secure alternative to modelines
  Plug 'ryanoasis/vim-devicons'         " File type icons to Vim plugins
  Plug 'mhinz/vim-startify'             " fancy startup screen
  Plug 'chrisbra/Colorizer'             " hex colorize
  Plug 'moll/vim-bbye'                  " helper around closing buffers

  " Only neovim has a built in terminal so if we are in neovim
  " then install terminal plugin
  if has('nvim')
    Plug 'kassio/neoterm'
  endif
" }}}
call plug#end()

" Automagicly install missing plugins on startup
augroup Plug
  autocmd!
  autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | q
    \| endif
augroup END
