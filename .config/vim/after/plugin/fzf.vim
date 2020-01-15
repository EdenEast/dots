if has_key(plugs, 'fzf.vim')
  " Check to see what command line searching programs are installed in this computer.
  " If ripgrep is installed then use that because ripgrep is love ripgrep is life
  "
  " from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
  if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
  endif
  if executable('rg')
    set grepprg=rg\ --no-heading\ --vimgrep
    set grepformat=%f:%l:%c:%m
  endif

  " Open fzf window bellow and about 20% of the screen
  let g:fzf_layout = { 'down': '~20%' }

  " Set Rg command to have a preview
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

  " Make fzf a previewer and use ripgrep to search. ripgrep will update when search changes.
  " Also a newview of the file around it on the right
  function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction
  command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

  " Use fd to do your file searching
  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'source': 'fd --type file --follow',
    \                               'options': '--tiebreak=index'}, <bang>0)

  " rg is the new ctrl-p, long life rg
  nnoremap <c-p> :Files<cr>

  nnoremap <leader>s :Rg<space>
  nnoremap <leader>S :RG<space>
endif
