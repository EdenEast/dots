if has_key(plugs, 'place.vim')
  " Start place motion to insert a single character
  nmap gs <Plug>(place-insert)

  " Start place motion to insert multiple characters
  nmap gS <Plug>(place-insert-multiple)
endif
