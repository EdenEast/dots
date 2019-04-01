"
" Leader mode mappings
"

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
" }}}
