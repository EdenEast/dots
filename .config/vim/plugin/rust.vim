
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock compiler cargo
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock setlocal makeprg=cargo

" Make quickfix window show up automaticly after compiling
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
