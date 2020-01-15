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
endif
