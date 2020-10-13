function eden#theme#init()
  " My eyes bleed with light themes. Save my eyes plz
  set background=dark

  " In our local_config_root ($HOME/.local/share/nvim) after/plugin/theme.vim
  " will be sourced with after everything has been loaded.
  let g:colorscheme_file = eden#path#join([g:local_config_root, 'after', 'plugin', 'theme.vim'])

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
  call eden#path#create_dir(fnamemodify(g:colorscheme_file, ':h'))
  call writefile(l:command, g:colorscheme_file)
endfunction
