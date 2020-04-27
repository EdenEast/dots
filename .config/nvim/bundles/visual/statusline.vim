Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

if !exists("g:lightline")
  let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'FugitiveHead',
        \   'filename': 'LightlineFilename'
        \ },
        \ }
endif

function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction
