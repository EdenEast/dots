" Modern performant generic finder and dispatcher for Vim and NeoVim
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

let g:clap_cache_directory = g:cache_root . '/clap'
" let g:clap_search_box_border_style = 'curve'

" Files -----------------------------------------------------------------------
nnoremap <silent> <leader>ff :<c-u>Clap files ++finder=rg --no-ignore --hidden --files<cr>
let g:which_key_map.f.f = 'file'

nnoremap <silent> <leader>fa :<c-u>Clap grep<cr>
let g:which_key_map.f.a = 'word'

nnoremap <silent> <leader>fq :<c-u>Clap quickfix<cr>
let g:which_key_map.f.q = 'quickfix'

nnoremap <silent> <leader>fh :<c-u>Clap history<cr>
let g:which_key_map.f.h = 'history'

" Buffers ---------------------------------------------------------------------
nnoremap <silent> <leader>bf :<c-u>Clap buffers<cr>
let g:which_key_map.b.f = 'find'

nnoremap <silent> <leader>bl :<c-u>Clap lines<cr>
let g:which_key_map.b.l = 'search line in buffers'

nnoremap <silent> <leader>bs :<c-u>Clap blines<cr>
let g:which_key_map.b.s = 'search in buffer'

