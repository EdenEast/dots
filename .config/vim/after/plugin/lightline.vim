if has_key(plugs, 'lightline.vim')
  let g:lightline = {
        \ 'component_function': {
        \   'filename': 'LightlineFilename',
        \ },
  \ }

  function! LightlineFilename()
    return expand('%:t') !=# '' ? @% : '[No Name]'
  endfunction
endif
