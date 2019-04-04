setlocal synmaxcol=0

if bufname(bufnr('%')) == '__LanguageClient__'
  setlocal nonumber
  setlocal norelativenumber
endif
