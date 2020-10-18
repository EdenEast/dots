"
" ███╗   ██╗██╗   ██╗██╗███╗   ███╗
" ████╗  ██║██║   ██║██║████╗ ████║    James Simpson
" ██╔██╗ ██║██║   ██║██║██╔████╔██║    https://github.com/edeneast
" ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║    https://github.com/edeneast/dots
" ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
"

" Depending on the environment, this folder might not be in the runtimepath.
" For example on windows I link this folder to %LocalAppData%\nvim
let g:nvim_user_config_path = fnamemodify(resolve(expand('<sfile>')), ':p:h')
let g:original_rtp = &rtp
let g:original_packpath = &packpath

" Only override runtimepath if paths have not been setup before
if !exists('g:eden_has_path_setup')
  let &runtimepath = g:nvim_user_config_path
endif

call eden#setup_paths(g:original_rtp, g:original_packpath)
call eden#init()
call eden#whichkey_init()
call eden#theme#init()
call eden#source_file(g:config_root . '/core/core.vim')

if has("nvim")
  lua require('init')
endif

