if has_key(plugs, 'fzf.vim')
 " Customize fzf colors to match your color scheme
 let g:fzf_colors =
 \ { 'fg':      ['fg', 'Normal'],
   \ 'bg':      ['bg', '#5f5f87'],
   \ 'hl':      ['fg', 'Comment'],
   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
   \ 'hl+':     ['fg', 'Statement'],
   \ 'info':    ['fg', 'PreProc'],
   \ 'border':  ['fg', 'Ignore'],
   \ 'prompt':  ['fg', 'Conditional'],
   \ 'pointer': ['fg', 'Exception'],
   \ 'marker':  ['fg', 'Keyword'],
   \ 'spinner': ['fg', 'Label'],
   \ 'header':  ['fg', 'Comment'] }

 let g:fzf_layout = { 'window': 'call float#create_center_window()' }
 let $FZF_DEFAULT_COMMAND = '--reverse' " top to bottom

 " Use rg if installed
 if executable('rg')
   let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
   set grepprg=rg\ --vimgrep
 endif

 " Use fd for file finding if installed
 if executable('fd')
   let $FZF_DEFAULT_COMMAND = 'fd --type f --follow'
   command! -bang -nargs=? -complete=dir Files
         \ call fzf#vim#files(<q-args>, {'source': 'fd --type file --follow',
         \                               'options': '--tiebreak=index'}, <bang>0)
 endif

 function! FloatingFzf() abort
   let l:fzf_files_options = '--preview "bat --line-range :'.&lines.' --theme="OneHalfDark" --style=numbers,changes --color always {2..-1}"'

   function! s:files()
     let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
     return s:prepend_icon(l:files)
   endfunction

   function! s:prepend_icon(candidates)
     let l:result = []
     for l:candidate in a:candidates
       let l:filename = fnamemodify(l:candidate, ':p:t')
       let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
       call add(l:result, printf('%s %s', l:icon, l:candidate))
     endfor

     return l:result
   endfunction

   function! s:edit_file(item)
     let l:pos = stridx(a:item, ' ')
     let l:file_path = a:item[pos+1:-1]
     execute 'silent e' l:file_path
   endfunction

   call fzf#run({
         \ 'source': <sid>files(),
         \ 'sink':   function('s:edit_file'),
         \ 'options': '-m --reverse ' . l:fzf_files_options,
         \ 'down':    '40%',
         \ 'window': 'call float#create_center_window()'})
 endfunction
endif

"if has_key(plugs, 'fzf.vim')
"  " Customize fzf colors to match your color scheme
"  let g:fzf_colors =
"  \ { 'fg':      ['fg', 'Normal'],
"    \ 'bg':      ['bg', '#5f5f87'],
"    \ 'hl':      ['fg', 'Comment'],
"    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"    \ 'hl+':     ['fg', 'Statement'],
"    \ 'info':    ['fg', 'PreProc'],
"    \ 'border':  ['fg', 'Ignore'],
"    \ 'prompt':  ['fg', 'Conditional'],
"    \ 'pointer': ['fg', 'Exception'],
"    \ 'marker':  ['fg', 'Keyword'],
"    \ 'spinner': ['fg', 'Label'],
"    \ 'header':  ['fg', 'Comment'] }

"  " Open fzf window bellow and about 20% of the screen
"  " let g:fzf_layout = { 'down': '~20%' }
"  " let g:fzf_layout = { 'window': 'call float#create_center_window()' }

"  " If it is possible jump to existing windows
"  let g:fzf_buffers_jump = 1

"  function! Launch_fzf()
"    let l:fzf_files_options = '--preview "bat --line-range :'.&lines.' --theme="OneHalfDark" --style=numbers,changes --color always {2..-1}"'

"    function! s:files()
"      let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
"      return s:prepend_icon(l:files)
"    endfunction

"    function! s:prepend_icon(candidates)
"      let l:result = []
"      for l:candidate in a:candidates
"        let l:filename = fnamemodify(l:candidate, ':p:t')
"        let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
"        call add(l:result, printf('%s %s', l:icon, l:candidate))
"      endfor

"      return l:result
"    endfunction

"    function! s:edit_file(item)
"      let l:pos = stridx(a:item, ' ')
"      let l:file_path = a:item[pos+1:-1]
"      execute 'silent e' l:file_path
"    endfunction

"    call fzf#run({
"          \ 'source': <sid>files(),
"          \ 'sink':   function('s:edit_file'),
"          \ 'options': '-m --reverse ' . l:fzf_files_options,
"          \ 'down':    '40%',
"          \ 'window': 'call float#create_center_window()'})
"  endfunction

"  " Check to see what command line searching programs are installed in this computer.
"  " If ripgrep is installed then use that because ripgrep is love ripgrep is life
"  "
"  " from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
"  if executable('ag')
"    set grepprg=ag\ --nogroup\ --nocolor
"  endif
"  if executable('rg')
"    set grepprg=rg\ --no-heading\ --vimgrep
"    set grepformat=%f:%l:%c:%m
"  endif

"  " Allow rg to take optional flags into the Rg command
"  command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)

"  " Make fzf a previewer and use ripgrep to search. ripgrep will update when search changes.
"  " Also a newview of the file around it on the right
"  " function! RipgrepFzf(query, fullscreen)
"    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
"    let initial_command = printf(command_fmt, shellescape(a:query))
"    let reload_command = printf(command_fmt, '{q}')
"    let spec = {'options': []}
"    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
"  endfunction
"  command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

"  " Use fd to do your file searching
"  command! -bang -nargs=? -complete=dir Files
"    \ call fzf#vim#files(<q-args>, {'source': 'fd --type file --follow',
"    \                               'options': '--tiebreak=index'}, <bang>0)

"  " Search hidden files as well
"  command! -bang -nargs=? -complete=dir HFiles
"    \ call fzf#vim#files(<q-args>, {'source': 'fd --type file --follow --hidden',
"    \                               'options': '--tiebreak=index'}, <bang>0)

"  " Mappings
"  " All search mapping function are accessable through '<leader>s'
"  " The action I use the most should have a shortcut to it
"  " for this case I find that rg though a folder is the most
"  " useful and the thing I use the most. This should be accessable
"  " quickly to it will be capital S as a shortcut.

"  " rg search all files for search term
"  nnoremap <leader>S :Rg<space>
"  nnoremap <leader>ss :RG<space>

"  " search for a file to open
"  nnoremap <leader>sf :Files<cr>

"  " search for files including hidden ones
"  nnoremap <leader>sF :HFiles<cr>

"  " search all open buffers
"  nnoremap <leader>sb :Buffers<cr>

"  " search/jump to an open window
"  nnoremap <leader>sw :Windows<cr>

"  " search the mark list
"  nnoremap <leader>sm :Marks<cr>

"  " search lines in all loaded buffers
"  nnoremap <leader>sl :Lines<space>

"  " search lines in current buffer
"  nnoremap <leader>sL :BLines<space>

"  " List of all fzf commands
"  "
"  " :Files [PATH]     Files (similar to :FZF)
"  " :GFiles [OPTS]    Git files (git ls-files)
"  " :GFiles?          Git files (git status)
"  " :Buffers          Open buffers
"  " :Colors           Color schemes
"  " :Ag [PATTERN]     ag search result (ALT-A to select all, ALT-D to deselect all)
"  " :Rg [PATTERN]     rg search result (ALT-A to select all, ALT-D to deselect all)
"  " :Lines [QUERY]    Lines in loaded buffers
"  " :BLines [QUERY]   Lines in the current buffer
"  " :Tags [QUERY]     Tags in the project (ctags -R)
"  " :BTags [QUERY]    Tags in the current buffer
"  " :Marks            Marks
"  " :Windows          Windows
"  " :Locate PATTERN   locate command output
"  " :History          v:oldfiles and open buffers
"  " :History:         Command history
"  " :History/         Search history
"  " :Snippets         Snippets (UltiSnips)
"  " :Commits          Git commits (requires fugitive.vim)
"  " :BCommits         Git commits for the current buffer
"  " :Commands         Commands
"  " :Maps             Normal mode mappings
"  " :Helptags         Help tags 1
"  " :Filetypes        File types
"endif
