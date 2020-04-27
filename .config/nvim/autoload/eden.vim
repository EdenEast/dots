function eden#init()
  " Make sure that we NEVER EVER go back to vi. This is the future not the past
  if &compatible
    set nocompatible
  endif

  " I will always want syntax no matter what
  syntax on

  " Make vim try and understand filetypes and load related plugins
  filetype plugin indent on

  " Set main configuration directory as parent directory
  let $VIM_PATH=expand('$HOME/.config/nvim')
  let g:config_root=expand('$HOME/.config/nvim')
  let g:cache_root=expand('$HOME/.cache/nvim')
  let g:package_root=g:cache_root . '/packages'
  let $VIM_LOCAL_PATH=expand('$HOME/.local/share/nvim')
  let g:local_config_root=expand('$HOME/.local/share/nvim')

  " Initialize base requirements
  if has('vim_starting')
    let g:mapleader="\<Space>"
    let g:maplocalleader='\\'

    " Release keymappings prefixes, evict entirely for use of plug-ins.
    nnoremap <Space>  <Nop>
    xnoremap <Space>  <Nop>
    nnoremap \        <Nop>
    xnoremap \        <Nop>
  endif

  " autocmd to source init.vim when ever a file in changed either global or local config root
  augroup source_nvim_config
    autocmd!
    autocmd BufWritePost $VIM_PATH/* execute 'source' $MYVIMRC
    autocmd BufWritePost $VIM_LOCAL_PATH/* source $MYVIMRC
  augroup end
endfunction

function eden#source_file(root_path, path)
  let abspath = resolve(a:root_path . '/' . a:path)
  execute 'source' fnameescape(abspath)
endfunction

function eden#check_source(filename)
  if filereadable(a:filename)
    let content = readfile(a:filename)
    if !empty(content)
      execute 'source' a:filename
    endif
  endif
endfunction

function eden#source_lua_file(root_path, path)
  let abspath = resolve(a:root_path . '/' . a:path)
  execute 'luafile' fnameescape(abspath)
endfunction

function eden#check_lua_source(filename)
  if filereadable(a:filename)
    let content = readfile(a:filename)
    if !empty(content)
      execute 'luafile' a:filename
    endif
  endif
endfunction

function eden#source_after()
  let l:files = split(globpath(g:config_root, 'after/**/*.vim'), '\n')
  for l:file in l:files
    call eden#check_source(l:file)
  endfor
endfunction

function eden#whichkey_init()
  " Define which-key directory here so that plugins can register their
  " bindings and description in place. If which-key is not installed
  " then this will not be used. If not used that is acceptable
  let g:which_key_map = {}
  let g:which_local_key_map = {}

  " Defining categories of mappings
  let g:which_key_map.b = { 'name' : '+buffer' }
  let g:which_key_map.c = { 'name' : '+code' }
  let g:which_key_map.f = { 'name' : '+find' }
  let g:which_key_map.g = { 'name' : '+vcs' }
  let g:which_key_map.t = { 'name' : '+toggle' }
endfunction
