
" When entering a window or leaving insert mode highlight
" trailing whitespace
if !exists('g:vscode')
  augroup trailing_whitespace
    autocmd!
    autocmd BufWinEnter * match Error /\s\+%#@<!$/
    autocmd InsertEnter * match Error /\s\+%#@<!$/
    autocmd InsertLeave * match Error /\s\+$/
  augroup end

" Makes sure that vim returns to the same line when you reenter a file
  augroup line_return
    autocmd!
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \     execute 'normal! g`"zvzz' |
      \ endif
  augroup end
endif
