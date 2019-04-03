"
" Command mode mappings
"

" When you forget to sudo... make sure to write the file
cmap w!! w !sudo tee % >/dev/null

cmap cwd lcd %:p:h

cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" command typo mapping and shift fixes
cmap W w
cmap WQ wq
cmap wQ wq
cmap Q q
cmap Tabe tabe
