
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock compiler cargo
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock setlocal makeprg=cargo

" Make quickfix window show up automaticly after compiling
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Make check will populate quickfix list with compiler warnings and errors.
" Clippy is accessable with leader modifier
map <F6> :make check<cr>
map <leader><F6> :make clippy<cr>

