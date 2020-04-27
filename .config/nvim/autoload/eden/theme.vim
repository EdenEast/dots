function eden#theme#init()
  " My eyes bleed with light themes. Save my eyes plz
  set background=dark

  let g:colorscheme_file = g:cache_root . '/theme.vim'
  call eden#check_source(g:colorscheme_file)

  augroup themes
    autocmd!
    autocmd ColorScheme * call eden#theme#post()
  augroup end
endfunction

function eden#theme#post()
  let l:command = ['']
  let l:command += ["if exists(\'g:colors_name\')"]
  let l:command += ["  if g:colors_name != \'" . g:colors_name . "\'"]
  let l:command += ['    colorscheme ' . g:colors_name]
  let l:command += ['  endif']
  let l:command += ['else']
  let l:command += ['  colorscheme ' . g:colors_name]
  let l:command += ['endif']
  call writefile(l:command, g:colorscheme_file)

  " let l:command = "if g:colors_name != \'".g:colors_name."\'|  colorscheme ".g:colors_name."|endif"
  " call writefile(split(l:command, "|"), g:colorscheme_file)
endfunction
