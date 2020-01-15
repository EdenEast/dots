if has('gui') || (has('nvim') && (has('win32') || has('win64')))
  " Turn off scrollbars. (Default on macOS is "egmrL").
  " set guifont=Source\ Code\ Pro\ Light:h13
  au GUIEnter * simalt ~x " open maximized
  set guioptions-=T       " remove toolbar
  set guioptions-=L       " remove left hand scrollbar when vs
  set guioptions-=l       " remove left hand scrollbar always present
  set guioptions-=R       " remove right hand scrollbar when vs
  set guioptions-=r       " remove right hand scrollbar always present
  set guioptions-=b       " remove bottom bar

  colorscheme neodark
endif
