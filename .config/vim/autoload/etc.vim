let g:etc#vim_path = expand('$HOME/.config/vim')
let g:etc#cache_path =
  \ expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '$HOME/.cache') . 'vim')

function! s:get_list_installed_colorschemes() abort
  return uniq(sort(map(
    \ globpath(&runtimepath, 'colors/*.vim', 0, 1),
    \ 'fnamemodify(v:val, ":t:r")'
    \ )))
endfunction

function! etc#init_theme()
  let l:schemes = s:get_list_installed_colorschemes()
  let l:default = 'gruvbox-mirror'
  let l:cache = g:etc#cache_path . '/theme.txt'

endfunction
