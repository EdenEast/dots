if !exists("g:lightline")
  let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'FugitiveHead',
        \   'filename': 'LightlineFilename',
        \   'cocstatus': 'coc#status'
        \ },
        \ }
endif

function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

