Plug 'szw/vim-maximizer'

let g:maximizer_set_default_mapping = 0
let g:maximizer_set_mapping_with_bang = 1

nnoremap <silent> <leader>bm :MaximizerToggle<cr>
let g:which_key_map.b.m = 'min/max'
