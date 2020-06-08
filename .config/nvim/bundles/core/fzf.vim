Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'yuki-ycino/fzf-preview.vim'

let $FZF_DEFAULT_OPTS = '-m' " top to bottom

if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --smart-case --hidden --follow --glob "!.git/*"'

    set grepprg=rg\ --vimgrep

    "  Allow rg to take optional arguments
    command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case ' . <q-args>, 1, <bang>0)
endif

if executable('fd')
    let $FZF_DEFAULT_COMMAND = 'fd --type f --follow --hidden --exclude ".git/*"'
    command! -bang -nargs=? -complete=dir Files
                \ call fzf#vim#files(<q-args>, {'source': 'fd --type file --follow --hidden --exclude ".git/*"',
                \                               'options': '--tiebreak=index'}, <bang>0)
endif

" Search files in directory
nnoremap <silent> <leader>fd :<c-u>Files<cr>
let g:which_key_map.f.d = 'file in dirs'

nnoremap <silent> <leader>fg :<c-u>GFiles<cr>
let g:which_key_map.f.g = 'file in git'

" Search files with rg
nnoremap <silent> <leader>fr :<c-u>Rg<space>
let g:which_key_map.f.r = 'rg search'

" Search lines in current buffer
nnoremap <silent> <leader>f/ :<c-u>BLines<cr>
let g:which_key_map.f['/'] = 'lines'

" Search lines in all buffers
nnoremap <silent> <leader>f? :<c-u>Lines<cr>
let g:which_key_map.f['?'] = 'buffer lines'

" Search lines in current buffer
nnoremap <silent> <leader>/ :<c-u>BLines<cr>

" Search lines in all buffers
nnoremap <silent> <leader>? :<c-u>Lines<cr>

