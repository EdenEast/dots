"
" Normal mode mappings
"

" I do not use ; so set ; to :
nnoremap ; :

" Quickly edit/reload configuration file
nnoremap gev :e $MYVIMRC<cr>
nnoremap gsv :so $MYVIMRC<cr>

" Toggle fold at current location
nnoremap <Tab> za

" Avoid unintentional switching to Ex mode.
nnoremap Q <nop>

" Multi-mode mappings (Normal, Visual)
map Y y$

" remove highlighting on escape
" NOTE: for some reason when you enter vim with this mapping
" it adds :2R to the command
" map <silent> <esc> :nohlsearch<cr>

" re-indent file and jump back to where the cursor was
map <F7> mzgg=G`z

" incsearch:
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" center search
nmap n nzz
nmap N nzz

" change dir to current file's dir
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Switch between the last two files
nnoremap <tab><tab> <c-^>

" copy to system clipboard
noremap gy "+y

" copy whole file to system clipboard
nnoremap gY gg"+yG

" Open files relative to current path:
nnoremap <leader>e :edit <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>s :split <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>v :vsplit <C-R>=expand("%:p:h") . "/" <CR>

" Move around splits without having to press <C-w> before each movement
nnoremap <C-h> <C-w>h<C-w>_
nnoremap <C-j> <C-w>j<C-w>_
nnoremap <C-k> <C-w>k<C-w>_
nnoremap <C-l> <C-w>l<C-w>_

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
