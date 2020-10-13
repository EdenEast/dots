let $FZF_DEFAULT_OPTS = '-m' " top to bottom

if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --smart-case --hidden --follow --glob "!.git/*"'

    set grepprg=rg\ --vimgrep
endif

if executable('fd')
    let $FZF_DEFAULT_COMMAND = 'fd --type f --follow --hidden --exclude ".git/*"'
    command! -bang -nargs=? -complete=dir Files
                \ call fzf#vim#files(<q-args>, {'source': 'fd --type file --follow --hidden --exclude ".git/*"',
                \                               'options': '--tiebreak=index'}, <bang>0)
endif

" Search files in directory
nnoremap <silent> <leader>fd :<c-u>Files!<cr>
let g:which_key_map.f.d = 'file in dirs'

nnoremap <silent> <leader>fg :<c-u>GFiles!<cr>
let g:which_key_map.f.g = 'file in git'

nnoremap <silent> <leader>fc :<c-u>Commands!<cr>
let g:which_key_map.f.g = 'file in git'

" Search lines in current buffer
nnoremap <silent> // :<c-u>BLines!<cr>

" Search lines in all buffers
nnoremap <silent> ?? :<c-u>Rg!<cr>
