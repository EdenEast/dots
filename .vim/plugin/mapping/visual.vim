"
" Visual mode mappings
"

" sort selected lines
vmap gs :sort<CR>

" Tab/shift-tab to indent/outdent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Keep selection when indenting/outdenting.
vnoremap > >gv
vnoremap < <gv

" Search for selected text
vnoremap * "xy/<C-R>x<CR>