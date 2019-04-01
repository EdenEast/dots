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
