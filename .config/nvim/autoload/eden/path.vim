function eden#path#create_dir(path)
  let s:abspath = fnamemodify(expand(a:path), ':p')
  if !isdirectory(s:abspath)
    call mkdir(expand(s:abspath), 'p')
  endif
endfunction

" function eden#path#join(root ...)
"   return simplify(resolve(a:root))
" endfunction

"function eden#path#runtime_path()
