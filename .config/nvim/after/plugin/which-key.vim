" To register the descriptions when using the on-demand load feature,
" use the autocmd hook to call which_key#register(), e.g., register for the Space key:
" autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
" autocmd! User vim-which-key call which_key#register('\\', 'g:which_local_key_map')

call which_key#register('<Space>', "g:which_key_map")
call which_key#register('\\', "g:which_local_key_map")

