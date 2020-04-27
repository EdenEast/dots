Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'yuki-ycino/fzf-preview.vim'

let $FZF_DEFAULT_OPTS = '-m' " top to bottom

if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

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

" Search for file
nnoremap <silent> <leader><cr> :Files<cr>

" Search files in directory
nnoremap <silent> <leader>fd :Files<cr>
let g:which_key_map.f.d = 'file in dirs'

" Search files with rg
nnoremap <silent> <leader>fr :Rg<space>
let g:which_key_map.f.r = 'rg search'

" Search lines in current buffer
nnoremap <silent> <leader>f/ :BLines<cr>
let g:which_key_map.f['/'] = 'lines'

" Search lines in all buffers
nnoremap <silent> <leader>f? :Lines<cr>
let g:which_key_map.f['?'] = 'buffer lines'

" Search files with rg
nnoremap <leader>\ :Rg<space>""<Left>

" Search lines in current buffer
nnoremap <silent> <leader>/ :BLines<cr>

" Search lines in all buffers
nnoremap <silent> <leader>? :Lines<cr>

