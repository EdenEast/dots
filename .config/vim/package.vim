" Install vim-plug if missing
if empty(glob('$HOME/.config/vim/autoload/plug.vim'))
  silent !mkdir -p "$HOME/.config/vim/autoload"
  silent !curl -fLo "$HOME/.config/vim/autoload/plug.vim" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME/.cache/vim/packages')
" There are two environments that I use vim/neovim in,
" traditional terminal vim/neovim and vscode -> neovim
" When using neovim in vscode I do not need most of my
" plugins as they are more enhancements to make vim more
" like a code editor, but there are some plugins that
" enhance or change the code of vim's modal editor
" these plugins are required regardless of what env I am in
" Text Objects: {{{
  Plug 'glts/vim-textobj-comment'     " comment text object
  Plug 'kana/vim-textobj-user'        " define your own text objects
  " Plug 'machakann/vim-sandwich'       " search/select/edit sandwiched textobjects
  Plug 'wellle/targets.vim'           " additional text objects
  Plug 'kana/vim-textobj-function'    " text object for functions
  Plug 'wellle/line-targets.vim'      " line text objects ci-
" }}}
" Editing: {{{
  " Plug 'jiangmiao/auto-pairs'       " autofil () && {}
  Plug 'kana/vim-smartinput'          " help autofil coding syntax like () && {}
  Plug 'terryma/vim-multiple-cursors' " ability to have multiple cursors
  Plug 'tpope/vim-repeat'             " make . support plugins
  Plug 'junegunn/vim-easy-align'      " alignment motions
  Plug 'justinmk/vim-sneak'           " Jump to any location specified by two characters
  Plug 'joereynolds/place.vim'        " add insertions to your text without moving your cursor
" }}}
"Fuzzy {{{
  " Install fzf into ~/.local/opt folder and install vim plugin
  Plug 'junegunn/fzf', {'dir': '~/.local/opt/fzf', 'do': './install --bin'}
  Plug 'junegunn/fzf.vim'
"}}}

if !exists('g:vscode')
  " Autocomplete: {{{
  if has('nvim')
    " Semantic language support
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
  endif
  " }}}
" Editing: {{{
  Plug 'editorconfig/editorconfig-vim' " vim respects .editorconfig files
  Plug 'tpope/vim-commentary'          " language agnostic comment motions
  Plug 'airblade/vim-rooter'           " open vim at the root of a project
" }}}
" Languages: {{{
  Plug 'sheerun/vim-polyglot'          " Install support for most languages
" }}}
" Productivity: {{{
  Plug 'jceb/vim-orgmode'              " emacs' org-mode support
  Plug 'w0rp/ale'                      " agnostic linter framework
" }}}
" Themes: {{{
  Plug 'CruizeMissile/Revolution.vim'
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'dylanaraps/wal.vim'
  Plug 'mhinz/vim-janah'
  Plug 'rhysd/vim-color-spring-night'
  Plug 'morhetz/gruvbox'
 " }}}
" Misc: {{{

  Plug 'thirtythreeforty/lessspace.vim' " Better whitespace stripping for vim
  Plug 'Yggdroot/indentLine'            " display indentation lines
  Plug 'ciaranm/securemodelines'        " secure alternative to modelines

  " fancy startup screen
  Plug 'mhinz/vim-startify'

  " hex colorize
  Plug 'chrisbra/Colorizer'

  "Gui enhancements
  Plug 'itchyny/lightline.vim'         " status line
  Plug 'machakann/vim-highlightedyank' " highlight yanked text

  if has('nvim')
    Plug 'kassio/neoterm'
  endif
" }}}
endi
call plug#end()

" Automagicly install missing plugins on startup
augroup Plug
  autocmd!
  autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | q
    \| endif
augroup END

  " Autocomplete: {{{
  " if has('nvim')
  "   Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
  "   Plug 'Shougo/neco-syntax'
  "   Plug 'Shougo/neco-vim', { 'for': 'vim' }
  "   Plug 'racer-rust/vim-racer'
  "   Plug 'zchee/deoplete-zsh', {'for': ['zsh', 'bash', 'sh']}

  "   " For func argument completion
  "   Plug 'Shougo/neosnippet'
  "   Plug 'Shougo/neosnippet-snippets'

  "   " include ctags for deoplete
  "   Plug 'Shougo/neoinclude.vim'
  " endif
  " }}}
