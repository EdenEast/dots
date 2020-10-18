function eden#theme#init()
  " My eyes bleed with light themes. Save my eyes plz
  set background=dark

  let g:colorscheme_file = eden#path#join([g:cache_root, 'colorscheme.vim'])

  augroup themes
    autocmd!
    autocmd ColorScheme * call eden#theme#post()
    autocmd VimEnter * call eden#theme#enter()
  augroup end
endfunction

function eden#theme#enter()
  if filereadable(g:colorscheme_file)
    call eden#source_file(g:colorscheme_file)
  endif
endfunction

function eden#theme#post()
  call eden#path#create_dir(fnamemodify(g:colorscheme_file, ':h'))
  call writefile(['colorscheme ' . g:colors_name], g:colorscheme_file)
endfunction
