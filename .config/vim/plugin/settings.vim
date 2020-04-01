scriptencoding utf-8

set autoindent                                   " maintain indent of current line
set backspace=indent,start,eol                   " allow unrestricted backspaceing in insert mode

if exists('$SUDO_USER')
  set nobackup                                   " dont create root-owned files
  set nowritebackup                              " dont create root-owned files
else
  if !isdirectory(expand("$HOME/.cache/vim/backup"))
    call mkdir(expand("$HOME/.cache/vim/backup", "p"))
  endif
  set backupdir=$HOME/.cache/vim/backup
endif

if has('wildignore')
  set backupskip+=*.re,*.rei                     " prevent bsb's watch mode from getting confused
endif

if exists('&belloff')
  set belloff=all                                " i NEVER want to hear this bell for ANY reason
endif

"if exists('+colorcolumn')
"let &l:colorcolumn='+' . join(range(0, 254), ',+')
"endif

set cursorline                                   " highlight current line

if exists('$SUDO_USER')
  set noswapfile                                 " dont create root-owned files
else
  if !isdirectory(expand("$HOME/.cache/vim/swap"))
    call mkdir(expand("$HOME/.cache/vim/swap", "p"))
  endif
  set directory=$HOME/.cache/vim/swap//
endif

set expandtab                                    " always use spaces instead of tabs

if has('folding')
  if has('windows')
    set fillchars=vert:┃                         " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
    set fillchars+=fold:·                        " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
  endif

  if has('nvim')
      set fillchars+=eob:\                       " suppress ~ at EndOfBuffer
  endif

  set foldmethod=indent                          " not as cool as syntax, but faster
  set foldlevelstart=99                          " start unfolded
endif

set formatoptions+=j                             " remove comment leader when joning comments
set formatoptions+=n                             " smart auto indenting inside numbered lists
set hidden                                       " allows you to hide buffers with unsaved changes without being prompted

if !has('nvim')
  set highlight+=@:Conceal                       " ~/@ at end of window, 'showbreak'
  set highlight+=N:DiffText                      " make current line number stand out a little
  set highlight+=c:LineNr                        " blend vertical separators with line numbers
endif

if exists('&inccommand')
  set inccommand=split                           " line preview of :s results
endif

set ignorecase                                   " ignore case in search
set incsearch                                    " do incremental searching
set iskeyword+=-                                 " treat - seperated words as a word object
set iskeyword+=_                                 " treat _ seperated words as a word object

set laststatus=2                                 "always show status line
set lazyredraw                                   " dont bother updating screen durring macro playback

if has('linebreak')
  set linebreak                                  " wrap long lines at characters in 'breakat'
endif

set list                                         " show whitespace
set listchars=nbsp:⦸                             " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅                            " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
                                                 " + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»                         " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«                        " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                           " BULLET (U+2022, UTF-8: E2 80 A2)
set modelines=5                                  " scan this many lines looking for modeline
set mouse=a                                      " automatically enable mouse usage
set mousehide                                    " hide the mouse cursor when typing
set nojoinspaces                                 " don't autoinsert two spaces after '.', '?', '!' for join command
set number                                       " show line numbers in gutter

if exists('+relativenumber')
  set relativenumber                             " show relative numbers in the gutter
endif

set scrolloff=3                                  " start scrolling 3 lines before edge of view port
set shiftround                                   " always indent by multiple of shiftwidth
set shiftwidth=4                                 " spaces per tab (when shifting)
set shortmess+=A                                 " ignore annoying swapfile messages
set shortmess+=I                                 " no spash screen
set shortmess+=O                                 " file-read message overrites previous
set shortmess+=T                                 " truncate non-file messages in middle
set shortmess+=W                                 " dont echo '[w]/[written]' when writing
set shortmess+=a                                 " use abbreviations in message '[ro]' instead of '[readonly]'
set shortmess+=o                                 " overwrite file-written mesage
set shortmess+=t                                 " truncate file messages at start

if has('linebreak')
  let &showbreak='↳ '                            " downwards arrow with tip rightwards(U+21B3, UTF-8: E2 86 B3)
endif

if has('showcmd')
  set noshowcmd                                  " dont show extra info at end of command line
endif

set showmode                                     " this should be the default

set sidescrolloff=3                              " same as 'scrolloff' but for columns
set smartcase                                    " use case sensitive search if capital letter is present
set smarttab                                     " <tab><bs> indent/deindent in leading whitespace

if v:progname != 'vi'
  set softtabstop=-1                             " use 'shiftwidth' for tab/bs at end of line
endif

if has('syntax')
  set spellcapcheck=                             " dont check for capital letters at the start of sentences
endif

if has('windows')
  set splitbelow                                 " open horizontal splits below the current one
endif

if has('vertsplit')
  set splitright                                 " open vertical splits right of the current one
endif

if exists('&swapsync')
  set swapsync=                                  " let OS sync swapfile lazily
endif
set switchbuf=usetab                             " try to reuse windows/tabs when switching buffers

if has('syntax')
  set synmaxcol=200                              " dont bother syntax highlighting long lines
endif

set tabstop=4                                    " spaces per tab

if has('termguicolors')
  set termguicolors                              " use guifg/guibg instead of ctermfg/ctermbg in terminal
endif

set textwidth=120                                " automatically hard wrap at 120 columns

set title                                        " set the title of the window to 'titlestring'
set ttyfast                                      " let vim know that I am using a fast term

if has('persistent_undo')
  if exists('$SUDO_USER')
    set noundofile                               " dont create root-owned files
  else
    if !isdirectory(expand("$HOME/.cache/vim/undo"))
      call mkdir(expand("$HOME/.cache/vim/undo", "p"))
    endif
    set undodir=$HOME/.cache/vim/undo
    set undofile                                 " use undo files
  endif
endif

set updatecount=80                               " update swap file every 80 characters typed
set updatetime=2000                              " cursorhold interval

if has('viminfo')
  if exists('$SUDO_USER')
    set viminfo=                                 " dont create root-owned files
  else
    set viminfo+=n$HOME/.cache/vim/viminfo
  endif
endif

if has('mksession')
  if !isdirectory(expand("$HOME/.cache/vim/session"))
    call mkdir(expand("$HOME/.cache/vim/session", "p"))
  endif
  set viewdir=$HOME/.cache/vim/session
  set viewoptions=cursor,folds                   " save/restore just these (with :{mk, load}view)
endif

if has('virtualedit')
  set virtualedit=block                          " allow cursor to move where there is no text in visual block mode
endif

set visualbell t_vb=                             " stop beeping for non-error errors, please god
set whichwrap=b,h,l,s,<,>,[,],~                  " allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
set wildcharm=<C-z>                              " substitute for 'wildchar' (<Tab>) in macros

if has('wildignore')
  set wildignore+=*.o,*.rej                      " patters to ignore during file-navigation
endif

if has('wildmenu')
  set wildmenu                                   " show options as list when switching buffers etc
endif

set wildmode=longest:full,full                   " shell-like autocomplete to unambiguous portions
