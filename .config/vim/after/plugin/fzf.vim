if has_key(plugs, 'fzf.vim')
  " from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
  if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
  endif
  if executable('rg')
    set grepprg=rg\ --no-heading\ --vimgrep
    set grepformat=%f:%l:%c:%m
  endif

  noremap <leader>s :Rg<space>
  let g:fzf_layout = { 'down': '~20%' }

  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

  function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

  command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
  nnoremap <leader>S :RG<space>

  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'source': 'fd --type file --follow',
    \                               'options': '--tiebreak=index'}, <bang>0)
  nnoremap <c-p> :Files<cr>

endif
