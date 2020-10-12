function eden#path#create_dir(path)
  let s:abspath = fnamemodify(expand(a:path), ':p')
  if !isdirectory(s:abspath)
    call mkdir(expand(s:abspath), 'p')
  endif
endfunction
