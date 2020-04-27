" Vim plugin that shows keybindings in popup
"
" Plugin lazy loaded
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'liuchengxu/vim-which-key'

" Timeout buffer between mapping presses to determine a key sequence
" By default timeoutlen is 1000 ms
set timeoutlen=250

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey '\\'<CR>
vnoremap <silent> <localleader> :WhichKeyVisual '\\'<CR>

