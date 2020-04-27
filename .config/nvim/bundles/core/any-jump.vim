Plug 'pechorin/any-jump.vim'

let g:any_jump_list_numbers = 1
let g:any_jump_grouping_enabled = 1
let g:any_jump_references_enabled = 1

nnoremap <silent> <leader>cj :AnyJump<cr>
xnoremap <silent> <leader>cj :AnyJump<cr>
let g:which_key_map.c.j = 'jump'

