"
" ███╗███╗   ██╗███╗██╗   ██╗██╗███╗   ███╗
" ██╔╝████╗  ██║╚██║██║   ██║██║████╗ ████║
" ██║ ██╔██╗ ██║ ██║██║   ██║██║██╔████╔██║
" ██║ ██║╚██╗██║ ██║╚██╗ ██╔╝██║██║╚██╔╝██║
" ███╗██║ ╚████║███║ ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚══╝╚═╝  ╚═══╝╚══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
"

" Depending on the environment that this file is sourced the runtimepath might
" not contain this folder. Save the current runtimepath and the override it to
" only be this folder. From there we will have access to the autoload folder
" for this directory and be able to call eden#init
let g:nvim_user_config_path = fnamemodify(resolve(expand('<sfile>')), ':p:h')
let &runtimepath = g:nvim_user_config_path . ',' . g:nvim_user_config_path . '/after,' . &runtimepath

call eden#init()
call eden#whichkey_init()
call eden#source_file($VIM_PATH, 'core/core.vim')
call eden#plugin#init()
call eden#theme#init()
call eden#source_after()

