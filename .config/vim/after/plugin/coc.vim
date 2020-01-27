if has_key(plugs, 'coc.nvim')
  " Setting the configuration location to be my ~/.config/vim directory
  let g:coc_config_home = g:config_root

  " Setting the location of coc extensions to be in ~/.cache/vim/coc
  let g:coc_extension_root = g:cache_root . '/coc'

  " List of global coc-extensions
  let g:coc_global_extensions = [
    \ 'coc-pairs',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-lists',
    \ 'coc-yank',
    \ 'coc-yaml',
    \ 'coc-git',
    \ 'coc-marketplace',
    \ 'coc-lines',
    \ 'coc-markdownlint',
    \ 'coc-rls',
    \ 'coc-go',
    \ 'coc-vimlsp',
    \ ]

  " Better display for messages
  " set cmdheight=2

  " You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=300

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()
  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  " Or use `complete_info` if your vim support it, like:
  " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

  " 'Smart' nevigation
  nmap <silent> E <Plug>(coc-diagnostic-prev)
  nmap <silent> W <Plug>(coc-diagnostic-next)
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " not sure that this is required seams to work when i dont set this
  " let $RUST_SRC_PATH = systemlist("rustc --print sysroot")[0] . "/lib/rustlib/src/rust/src"

  " Use K to show documentation in preview windw
  nnoremap <silent> K :call <SID>show_documentation()<CR>
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
endif
