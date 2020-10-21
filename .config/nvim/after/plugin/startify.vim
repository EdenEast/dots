let s:header = [
      \'',
      \'███████╗██████╗ ███████╗███╗   ██╗',
      \'██╔════╝██╔══██╗██╔════╝████╗  ██║',
      \'█████╗  ██║  ██║█████╗  ██╔██╗ ██║',
      \'██╔══╝  ██║  ██║██╔══╝  ██║╚██╗██║',
      \'███████╗██████╔╝███████╗██║ ╚████║',
      \'╚══════╝╚═════╝ ╚══════╝╚═╝  ╚═══╝',
      \'',
      \]


let g:startify_custom_header = eden#util#center_lines(s:header)

nnoremap <silent> <Leader>ts  :<C-u>Startify<CR>
let g:which_key_map.t.s = 'startify'

autocmd! FileType startify
autocmd FileType startify set laststatus=0 showtabline=0
  \| autocmd BufLeave <buffer> set laststatus=2 showtabline=1
autocmd User Startified setlocal buflisted
