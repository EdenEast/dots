let g:plug_path = fnamemodify(resolve(expand('<sfile>:p')), ':h:h') . '/plug.vim'
let g:bundle_dir = g:config_root . '/bundles'

function eden#plugin#init()
  call eden#plugin#start()
  call eden#plugin#bundle_config()
  call eden#plugin#end()
endfunction

function eden#plugin#start()
  if !filereadable(g:plug_path)
    if executable('curl')
      echom 'Installing vim-plug at ' . g:plug_path
      let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

      call system('curl -fLo ' . shellescape(g:plug_path) . ' --create-dirs ' . plugurl)
      if v:shell_error
        echom "Error downloading vim-plug. Please install it manually.\n"
        exit
      endif

      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    else
      echom "vim-plug not installed. Please install it manually or install curl.\n"
      exit
    endif
  endif

  call eden#path#create_dir(g:package_root)
  call plug#begin(g:package_root)
endfunction

function eden#plugin#bundle_config()
  let l:files = split(globpath(g:bundle_dir, '**/*.vim'), '\n')
  for l:file in l:files
    call eden#check_source(l:file)
  endfor
endfunction

function eden#plugin#end()
  call plug#end()

  " Install missing plugins on startup
  augroup plug
    autocmd!
    autocmd vimenter *
          \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
          \|   PlugInstall --sync | q
          \| endif
  augroup END
endfunction

function eden#plugin#exists(name)
  let l:plugin_dir = g:package_root . '/' . a:name
  return isdirectory(l:plugin_dir)
endfunction
