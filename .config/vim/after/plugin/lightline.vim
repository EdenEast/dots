if has_key(plugs, 'lightline.vim')
  " list of colorscheme
  " https://github.com/itchyny/lightline.vim/blob/master/colorscheme.md
  let g:lightline = {
        \ 'colorscheme': 'one',
        \ 'component_function': {
        \   'filename': 'LightlineFilename',
        \ },
  \ }

  function! LightlineFilename()
    return expand('%:t') !=# '' ? @% : '[No Name]'
  endfunction
endif
