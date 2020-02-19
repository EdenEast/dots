" Make j and k go up and down visible lines
nnoremap j gj
nnoremap k gk

nnoremap <leader>w :w<cr>
nnoremap <leader>W :w!<cr>

nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>

nnoremap <leader>c :Bdelete<cr>
nnoremap <leader>C :Bdelete!<cr>

" Read the current line and execute that in your $SHELL.
" The resulting output of the command will replace the line
" that you were on. This is very handy. Also we dont use Ex mode
nnoremap Q !!$SHELL <cr>

" Yank the current line and then execute it as a :command
nnoremap <c-q> yy:@" <cr>

" Multi-mode mappings (Normal, Visual)
" map Y y$

" remove highlighting on escape
" NOTE: for some reason when you enter vim with this mapping
" it adds :2R to the command
" map <silent> <esc> :nohlsearch<cr>

" Refresh the current file
map <F5> :e %<cr>
map <leader><F5> :source %<cr>

map <F3> :set spell!<cr>
map <F4> :tabedit $HOME/.config/vim/vimrc<cr>

" re-indent file and jump back to where the cursor was
map <F7> mzgg=G`z

" incsearch:
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" center search
nmap n nzz
nmap N Nzz

" change dir to current file's dir
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" disable arrow keys in normal mode
" bad me for using the arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Repurpose cursor keys
" nnoremap <slient> <Up> :cprevious<cr>
" nnoremap <slient> <Down> :cnext<cr>
" nnoremap <slient> <Left> :cpfile<cr>
" nnoremap <slient> <Right> :cnfile<cr>

" nnoremap <slient> <S-Up> :lprevious<cr>
" nnoremap <slient> <S-Down> :lnext<cr>
" nnoremap <slient> <S-Left> :lpfile<cr>
" nnoremap <slient> <S-Right> :lnfile<cr>

" Tab/shift-tab to indent/outdent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Keep selection when indenting/outdenting.
vnoremap > >gv
vnoremap < <gv

" Search for selected text
vnoremap * "xy/<C-R>x<CR>

" When I am in insert mode wanting to paste would be nice to use <c-v>
inoremap <c-v> <c-r>+

" When you forget to sudo... make sure to write the file
cmap w!! w !sudo tee % >/dev/null

" command typo mapping and shift fixes
" cmap W w
" cmap WQ wq
" cmap wQ wq
" cmap Q q
" cmap Tabe tabe

" a quicker and easier way to escape insert mode
inoremap jj <esc>

" Quickly edit/reload configuration file
nnoremap gev :e $MYVIMRC<cr>
nnoremap gsv :so $MYVIMRC<cr>

" I never use this widnow and only ever get there by trying to quit so just quit
nmap q: :q

" Toggle fold at current location
" NOTE: not sure I want to use <tab> for this functionality
" nnoremap <Tab> za

" Move around splits without having to press <C-w> before each movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Folding: {{{
" Folding hotkeys are accessable from <leader>f

" Toggle the current fold
nnoremap <leader>ff za
vnoremap <leader>ff za

" Open what ever fold we are in
nnoremap <leader>fo zczO
" focus the current line, close all folds and
" open the fold for the current line
nnoremap <leader>fa mzzMzvzz12<c-e>`z

nnoremap <leader>f0 :set foldlevel=0<cr>
nnoremap <leader>f1 :set foldlevel=1<cr>
nnoremap <leader>f2 :set foldlevel=2<cr>
nnoremap <leader>f3 :set foldlevel=3<cr>
nnoremap <leader>f4 :set foldlevel=4<cr>
nnoremap <leader>f5 :set foldlevel=5<cr>
nnoremap <leader>f6 :set foldlevel=6<cr>
nnoremap <leader>f7 :set foldlevel=7<cr>
nnoremap <leader>f8 :set foldlevel=8<cr>
nnoremap <leader>f9 :set foldlevel=9<cr>
" }}}

" Terminal: {{{
if has('nvim')
  " split navication in terminal
  tnoremap <c-h> <c-\><c-w>h
  tnoremap <c-j> <c-\><c-w>j
  tnoremap <c-k> <c-\><c-w>k
  tnoremap <c-l> <c-\><c-w>l

  " escape terminal
  tnoremap <esc> <c-\><c-n>
  tnoremap <m-[> <esc>

  " the modifier to interact with the terminal is <leader>t
  nnoremap <leader>t :vertical botright Ttoggle<cr><c-w>l

  " vs term://git-cmd.exe --no-cd --command=usr/bin/bash.exe -l -i
endif
" }}

" " Terminal: {{{
" if has('nvim')
"   " use neovim-remote (pip3 install neovim-remote) allows
"   " opening a new split inside neovim instead of nesting
"   " neovim processes for git commit
"     let $VISUAL      = 'nvr -cc split --remote-wait +"setlocal bufhidden=delete"'
"     let $GIT_EDITOR  = 'nvr -cc split --remote-wait +"setlocal bufhidden=delete"'
"     let $EDITOR      = 'nvr -l'
"     let $ECTO_EDITOR = 'nvr -l'

"   " set cursor modes
"     set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
"           \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
"           \,sm:block-blinkwait175-blinkoff150-blinkon175

"   " interactive find replace preview
"     set inccommand=nosplit

"   " Navigate neovim + neovim terminal emulator with alt+direction
"     tnoremap <c-h> <C-\><C-n><C-w>h
"     tnoremap <c-j> <C-\><C-n><C-w>j
"     tnoremap <c-k> <C-\><C-n><C-w>k
"     tnoremap <c-l> <C-\><C-n><C-w>l

"   " easily escape terminal
"     tnoremap <Esc> <C-\><C-n>
"     tnoremap <M-[> <Esc> " To send an escape key to the shell
"     " tnoremap <leader><esc> <C-\><C-n><esc><cr>
"     " tnoremap <C-o> <C-\><C-n><esc><cr>

"   " quickly toggle term
"     nnoremap <silent> <leader>o :vertical botright Ttoggle<cr><C-w>l
"     nnoremap <silent> <leader>O :horizontal rightbelow Ttoggle<cr><C-w>j
"     nnoremap <silent> <leader><space> :vertical botright Ttoggle<cr><C-w>l

"     " close terminal
"     tnoremap <silent> <leader>o <C-\><C-n>:Ttoggle<cr>
"     tnoremap <silent> <leader><space> <C-\><C-n>:Ttoggle<cr>

"   " send stuff to REPL using NeoTerm
"     nnoremap <silent> <c-s>l :TREPLSendLine<CR>
"     vnoremap <silent> <c-s>s :TREPLSendSelection<CR>

"   " pasting works quite well in neovim as is so disabling yo
"     nnoremap <silent> yo o
"     nnoremap <silent> yO O
" endif
" " }}}
