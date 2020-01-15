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

  " Search hidden files as well
  command! -bang -nargs=? -complete=dir HFiles
    \ call fzf#vim#files(<q-args>, {'source': 'fd --type file --follow --hidden',
    \                               'options': '--tiebreak=index'}, <bang>0)

  " Mappings
  " All search mapping function are accessable through '<leader>s'

  " rg search all files for search term
  nnoremap <leader>ss :Rg<space>
  nnoremap <leader>sS :RG<space>

  " search for a file to open
  nnoremap <leader>sf :Files<cr>

  " search for files including hidden ones
  nnoremap <leader>sF :HFiles<cr>

  " search all open buffers
  nnoremap <leader>sb :Buffers<cr>

  " search/jump to an open window
  nnoremap <leader>sw :Windows<cr>

  " search the mark list
  nnoremap <leader>sm :Marks<cr>

  " search lines in all loaded buffers
  nnoremap <leader>sl :Lines<space>

  " search lines in current buffer
  nnoremap <leader>sL :BLines<space>

  " List of all fzf commands
  "
  " :Files [PATH]     Files (similar to :FZF)
  " :GFiles [OPTS]    Git files (git ls-files)
  " :GFiles?          Git files (git status)
  " :Buffers          Open buffers
  " :Colors           Color schemes
  " :Ag [PATTERN]     ag search result (ALT-A to select all, ALT-D to deselect all)
  " :Rg [PATTERN]     rg search result (ALT-A to select all, ALT-D to deselect all)
  " :Lines [QUERY]    Lines in loaded buffers
  " :BLines [QUERY]   Lines in the current buffer
  " :Tags [QUERY]     Tags in the project (ctags -R)
  " :BTags [QUERY]    Tags in the current buffer
  " :Marks            Marks
  " :Windows          Windows
  " :Locate PATTERN   locate command output
  " :History          v:oldfiles and open buffers
  " :History:         Command history
  " :History/         Search history
  " :Snippets         Snippets (UltiSnips)
  " :Commits          Git commits (requires fugitive.vim)
  " :BCommits         Git commits for the current buffer
  " :Commands         Commands
  " :Maps             Normal mode mappings
  " :Helptags         Help tags 1
  " :Filetypes        File types
endif
