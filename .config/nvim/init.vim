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
let &runtimepath = g:nvim_user_config_path

call eden#setup_paths(g:original_rtp, g:original_packpath)
call eden#init()
call eden#whichkey_init()
call eden#source_file(g:config_root, 'core/core.vim')

