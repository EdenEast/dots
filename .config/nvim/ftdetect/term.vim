" Detect terminal and set it as a filetype
augroup TermDetect
    au!
    au TermOpen term://*  set filetype=term
augroup END