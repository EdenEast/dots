if has_key(plugs, 'ctrlp.vim')
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
endif
