function eden#runtimepath#init_prev(prev)
  let l:prevs = split(a:prev, ',')
  let l:paths = split(&runtimepath, ',')
  for iter in l:prevs
    if get(l:paths, iter) == 0
      call add(l:paths, iter)
    endif
  endfor
  let &runtimepath = join(l:paths, ',')
endfunction
