" Install vim-plug if missing
if empty(glob('$XDG_CONFIG_HOME/vim/autoload/plug.vim'))
  silent !curl -fLo $XDG_CONFIG_HOME/vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$XDG_CACHE_HOME/vim/packages') " Autocomplete: {{{
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
  Plug 'glts/vim-textobj-comment'
  Plug 'kana/vim-textobj-user'
  Plug 'tpope/vim-surround'
  Plug 'wellle/targets.vim'
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

  " fancy startup screen
  Plug 'mhinz/vim-startify'

  if has('nvim')
    Plug 'kassio/neoterm'
  endif
" }}}
call plug#end()


" Here is a list of plugins that I need to look at and install
"
" " Legacy Vim: {{{
"   " Compatibility for legacy vim with neovim's async api
"   " if !has('nvim')
"   "   Plug 'roxma/vim-hug-neovim-rpc'
"   "   Plug 'roxma/nvim-yarp'
"   " endif
" " }}}

" Plug 'editorconfig/editorconfig-vim'
" Plug 'jiangmiao/auto-pairs'
" Plug 'kana/vim-smartinput'
" Plug 'tpope/vim-commentary'
"
" " productivity
" Plug 'jceb/vim-orgmode'
" Plug 'kien/ctrlp.vim'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'tpope/vim-repeat'
" Plug 'wincent/replay'
"
" " movement
" Plug 'christoomey/vim-tmux-navigator'
"
" " visual
" Plug 'Yggdroot/indentLine'
" Plug 'haya14busa/incsearch.vim'
" Plug 'scrooloose/nerdtree'
" Plug 'xuyuanp/nerdtree-git-plugin'
"
" Plug 'majutsushi/tagbar'
"
" " Deoplete: {{{
"   Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
"   Plug 'Shougo/neco-syntax'
"   Plug 'Shougo/neco-vim', { 'for': 'vim' }
"   Plug 'fszymanski/deoplete-emoji'
"   Plug 'zchee/deoplete-go'
"   " Plug 'wokalski/autocomplete-flow'
"   Plug 'racer-rust/vim-racer'
"   Plug 'zchee/deoplete-zsh', {'for': ['zsh', 'bash', 'sh']}

"   " For func argument completion
"   Plug 'Shougo/neosnippet'
"   Plug 'Shougo/neosnippet-snippets'

"   " include ctags for deoplete
"   Plug 'Shougo/neoinclude.vim'

"   " ruby sources for deoplete
"   Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }
" " }}}

" " Editing: {{{
"   Plug 'editorconfig/editorconfig-vim'
"   Plug 'jiangmiao/auto-pairs'
"   Plug 'kana/vim-smartinput'
"   Plug 'tpope/vim-commentary'
" " }}}

" " Neovim: {{{
"   if has('nvim')
"     " abstraction on top of neovim terminal
"     Plug 'kassio/neoterm'

"     " run tests at the speed of thought
"     Plug 'janko-m/vim-test'

"     " Highlight Yanked String
"     Plug 'machakann/vim-highlightedyank'

"     " Language Server Protocol (LSP) support for vim and neovim
"     Plug 'autozimu/LanguageClient-neovim', {
"           \ 'branch': 'next',
"           \ 'do': 'bash install.sh',
"           \ }

"     if !exists('$TMUX')
"       " simulate tmux shortcuts in neovim
"       Plug 'hkupty/nvimux'
"     endif
"   endif
" " }}}

" " Navigation: {{{
"   Plug 'tpope/vim-vinegar'
"   Plug 'easymotion/vim-easymotion'
" " }}}

" " NERDTree: {{{
"   " NERDTree... tree explorer for vim
"   Plug 'scrooloose/nerdtree'

"   " Nerdtree show git status
"   Plug 'Xuyuanp/nerdtree-git-plugin'

"   " highlight file icons with different colors
"   Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" " }}}

" " Productivity: {{{
"   Plug 'jceb/vim-orgmode'
"   Plug 'ctrlpvim/ctrlp.vim'
"   Plug 'terryma/vim-multiple-cursors'
"   Plug 'tpope/vim-repeat'
"   Plug 'wincent/replay'
" " }}}

" " Movement: {{{
"   Plug 'christoomey/vim-tmux-navigator'
" " }}}

" " Searching: {{{
"   " highlights all search results and allows tabbing between them
"   Plug 'haya14busa/incsearch.vim'

"   " Sublime text like search results
"   Plug 'dyng/ctrlsf.vim', { 'on': 'CtrlSF' }

"   " Ack/Ag vim integration
"   Plug 'mileszs/ack.vim'

"   " RipGrep - grep is dead. All hail the new king RipGrep.
"   Plug 'jremmen/vim-ripgrep'
" " }}}

" " Text objects: {{{
"   Plug 'glts/vim-textobj-comment'
"   Plug 'kana/vim-textobj-user'
"   Plug 'tpope/vim-surround'
"   Plug 'wellle/targets.vim'
" " }}}


" " Writing: {{{
"   " distraction free writing (like iA Writer)
"   Plug 'laktek/distraction-free-writing-vim', { 'on': 'ToggleDistractionFreeWriting' }

"   " Distraction free writing in vim
"   Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

"   " Highlight current paragraph (works well with goyo)
"   Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
" " }}}

" " Misc {{{
"   " replacement for matchit
"   Plug 'andymass/vim-matchup'

"   " profiling vim startup
"   Plug 'tweekmonster/startuptime.vim'

"   " Multiple cursor emulation (a la Sublime Text) using ctrl-n
"   Plug 'terryma/vim-multiple-cursors'

"   " get docs for command under cursor (with Dash or web) (mapped to gK)
"   Plug 'keith/investigate.vim'

"   " automatic bulleted lists
"   Plug 'dkarter/bullets.vim'

"   " Scratch buffers
"   Plug 'mtth/scratch.vim'

"   " Auto close matching pairs {} \"\", etc..
"   Plug 'jiangmiao/auto-pairs'

"   " The ultimate undo history visualizer for VIM
"   Plug 'mbbill/undotree'

"   " Indent lines (visual indication)
"   Plug 'Yggdroot/indentLine'
" " }}}
