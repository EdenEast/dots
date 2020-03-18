let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <expr> <C-Space> coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\" : "\"
inoremap <Plug>(operator-sandwich-gv) gv
inoremap <Plug>(operator-sandwich-g@) g@
inoremap <silent> <Plug>(fzf-maps-i) :call fzf#vim#maps('i', 0)
inoremap <expr> <Plug>(fzf-complete-buffer-line) fzf#vim#complete#buffer_line()
inoremap <expr> <Plug>(fzf-complete-line) fzf#vim#complete#line()
inoremap <expr> <Plug>(fzf-complete-file-ag) fzf#vim#complete#path('ag -l -g ""')
inoremap <expr> <Plug>(fzf-complete-file) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -type f -print -o -type l -print | sed 's:^..::'")
inoremap <expr> <Plug>(fzf-complete-path) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -print | sed '1d;s:^..::'")
inoremap <expr> <Plug>(fzf-complete-word) fzf#vim#complete#word()
inoremap <silent> <Plug>CocRefresh =coc#_complete()
nmap  <Plug>(SmoothieBackwards)
nmap  <Plug>(SmoothieDownwards)
nmap  <Plug>(SmoothieForwards)
nnoremap  h
vnoremap 	 >gv
nnoremap <NL> j
nnoremap  k
nnoremap  l
xnoremap <silent>  :call multiple_cursors#new("v", 0)
nnoremap <silent>  :call multiple_cursors#new("n", 1)
nnoremap  yy:@" 
nmap  <Plug>(SmoothieUpwards)
nnoremap  ? :Lines
nnoremap  / :BLines
nnoremap  s :Rg 
nnoremap  e :call FloatingFzf()
nmap  <F2> :ColorHighlight
nnoremap  f9 :set foldlevel=9
nnoremap  f8 :set foldlevel=8
nnoremap  f7 :set foldlevel=7
nnoremap  f6 :set foldlevel=6
nnoremap  f5 :set foldlevel=5
nnoremap  f4 :set foldlevel=4
nnoremap  f3 :set foldlevel=3
nnoremap  f2 :set foldlevel=2
nnoremap  f1 :set foldlevel=1
nnoremap  f0 :set foldlevel=0
nnoremap  fa mzzMzvzz12`z
nnoremap  fo zczO
vnoremap  ff za
nnoremap  ff za
nnoremap    
nnoremap  cd :cd %:p:h:pwd
map  <F5> :source %
nnoremap  C :Bdelete!
nnoremap  c :Bdelete
nnoremap  Q :q!
nnoremap  q :q
nnoremap  W :w!
nnoremap  w :w
vnoremap * "xy/x
xmap , <Plug>Sneak_,
omap , <Plug>Sneak_,
nmap , <Plug>Sneak_,
xmap ; <Plug>Sneak_;
omap ; <Plug>Sneak_;
nmap ; <Plug>Sneak_;
vnoremap < <gv
vnoremap > >gv
xnoremap <silent> @(targets) :call targets#do()
onoremap <silent> @(targets) :call targets#do()
xmap <expr> A targets#e('o', 'A', 'A')
omap <expr> A targets#e('o', 'A', 'A')
nmap <silent> E <Plug>(coc-diagnostic-prev)
xmap <expr> I targets#e('o', 'I', 'I')
omap <expr> I targets#e('o', 'I', 'I')
nmap N Nzz
nnoremap Q !!$SHELL 
vmap Q gq
omap Q gq
nmap S <Plug>Sneak_S
nmap <silent> W <Plug>(coc-diagnostic-next)
xmap Z <Plug>Sneak_S
omap Z <Plug>Sneak_S
xmap <expr> a targets#e('o', 'a', 'a')
omap <expr> a targets#e('o', 'a', 'a')
omap aF <Plug>(textobj-function-A)
xmap aF <Plug>(textobj-function-A)
omap af <Plug>(textobj-function-a)
xmap af <Plug>(textobj-function-a)
omap ac <Plug>(textobj-comment-a)
xmap ac <Plug>(textobj-comment-a)
omap aC <Plug>(textobj-comment-big-a)
xmap aC <Plug>(textobj-comment-big-a)
xmap as <Plug>(textobj-sandwich-query-a)
omap as <Plug>(textobj-sandwich-query-a)
xmap ab <Plug>(textobj-sandwich-auto-a)
omap ab <Plug>(textobj-sandwich-auto-a)
nmap cV <Plug>SystemPasteLine
xmap cv <Plug>SystemPaste
nmap cv <Plug>SystemPaste
nmap cP <Plug>SystemCopyLine
xmap cp <Plug>SystemCopy
nmap cp <Plug>SystemCopy
nmap gK :SplitjoinJoin
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gd <Plug>(coc-definition)
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
vmap gs <Plug>SortMotionVisual
nmap gss <Plug>SortLines
nmap gs <Plug>SortMotion
nmap gcu <Plug>Commentary<Plug>Commentary
nmap gcc <Plug>CommentaryLine
omap gc <Plug>Commentary
nmap gc <Plug>Commentary
xmap gc <Plug>Commentary
xnoremap <silent> gî :call multiple_cursors#select_all("v", 0)
nnoremap <silent> gî :call multiple_cursors#select_all("n", 0)
xnoremap <silent> g :call multiple_cursors#new("v", 0)
nnoremap <silent> g :call multiple_cursors#new("n", 0)
nmap gJ :SplitjoinSplit
nnoremap gsv :so $MYVIMRC
nnoremap gev :e $MYVIMRC
xmap <expr> i targets#e('o', 'i', 'i')
omap <expr> i targets#e('o', 'i', 'i')
omap if <Plug>(textobj-function-i)
xmap if <Plug>(textobj-function-i)
omap iF <Plug>(textobj-function-I)
xmap iF <Plug>(textobj-function-I)
omap ic <Plug>(textobj-comment-i)
xmap ic <Plug>(textobj-comment-i)
xmap is <Plug>(textobj-sandwich-query-i)
omap is <Plug>(textobj-sandwich-query-i)
xmap ib <Plug>(textobj-sandwich-auto-i)
omap ib <Plug>(textobj-sandwich-auto-i)
nnoremap j gj
nnoremap k gk
nmap n nzz
nmap q: :q
nmap <silent> srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap <silent> sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
xmap sr <Plug>(operator-sandwich-replace)
xmap sd <Plug>(operator-sandwich-delete)
omap sa <Plug>(operator-sandwich-g@)
xmap sa <Plug>(operator-sandwich-add)
nmap sa <Plug>(operator-sandwich-add)
xmap s <Plug>Sneak_s
nmap s <Plug>Sneak_s
omap z <Plug>Sneak_s
xnoremap <silent> <Plug>(coc-git-chunk-outer) :call coc#rpc#request('doKeymap', ['git-chunk-outer'])
onoremap <silent> <Plug>(coc-git-chunk-outer) :call coc#rpc#request('doKeymap', ['git-chunk-outer'])
xnoremap <silent> <Plug>(coc-git-chunk-inner) :call coc#rpc#request('doKeymap', ['git-chunk-inner'])
onoremap <silent> <Plug>(coc-git-chunk-inner) :call coc#rpc#request('doKeymap', ['git-chunk-inner'])
nnoremap <silent> <Plug>(coc-git-commit) :call coc#rpc#notify('doKeymap', ['git-commit'])
nnoremap <silent> <Plug>(coc-git-chunkinfo) :call coc#rpc#notify('doKeymap', ['git-chunkinfo'])
nnoremap <silent> <Plug>(coc-git-prevchunk) :call coc#rpc#notify('doKeymap', ['git-prevchunk'])
nnoremap <silent> <Plug>(coc-git-nextchunk) :call coc#rpc#notify('doKeymap', ['git-nextchunk'])
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
nmap <silent> <Plug>CommentaryUndo :echoerr "Change your <Plug>CommentaryUndo map to <Plug>Commentary<Plug>Commentary"
noremap <Plug>(sandwich-nop) <Nop>
xnoremap <silent> <expr> <Plug>(textobj-sandwich-literal-query-a) textobj#sandwich#query('x', 'a', {}, [])
onoremap <silent> <expr> <Plug>(textobj-sandwich-literal-query-a) textobj#sandwich#query('o', 'a', {}, [])
nnoremap <silent> <expr> <Plug>(textobj-sandwich-literal-query-a) textobj#sandwich#query('n', 'a', {}, [])
xnoremap <silent> <expr> <Plug>(textobj-sandwich-literal-query-i) textobj#sandwich#query('x', 'i', {}, [])
onoremap <silent> <expr> <Plug>(textobj-sandwich-literal-query-i) textobj#sandwich#query('o', 'i', {}, [])
nnoremap <silent> <expr> <Plug>(textobj-sandwich-literal-query-i) textobj#sandwich#query('n', 'i', {}, [])
xnoremap <silent> <expr> <Plug>(textobj-sandwich-query-a) textobj#sandwich#query('x', 'a')
onoremap <silent> <expr> <Plug>(textobj-sandwich-query-a) textobj#sandwich#query('o', 'a')
nnoremap <silent> <expr> <Plug>(textobj-sandwich-query-a) textobj#sandwich#query('n', 'a')
xnoremap <silent> <expr> <Plug>(textobj-sandwich-query-i) textobj#sandwich#query('x', 'i')
onoremap <silent> <expr> <Plug>(textobj-sandwich-query-i) textobj#sandwich#query('o', 'i')
nnoremap <silent> <expr> <Plug>(textobj-sandwich-query-i) textobj#sandwich#query('n', 'i')
xnoremap <silent> <expr> <Plug>(textobj-sandwich-auto-a) textobj#sandwich#auto('x', 'a')
onoremap <silent> <expr> <Plug>(textobj-sandwich-auto-a) textobj#sandwich#auto('o', 'a')
nnoremap <silent> <expr> <Plug>(textobj-sandwich-auto-a) textobj#sandwich#auto('n', 'a')
xnoremap <silent> <expr> <Plug>(textobj-sandwich-auto-i) textobj#sandwich#auto('x', 'i')
onoremap <silent> <expr> <Plug>(textobj-sandwich-auto-i) textobj#sandwich#auto('o', 'i')
nnoremap <silent> <expr> <Plug>(textobj-sandwich-auto-i) textobj#sandwich#auto('n', 'i')
xnoremap <silent> <Plug>(textobj-sandwich-tag-a) :call sandwich#magicchar#t#at()
xnoremap <silent> <Plug>(textobj-sandwich-tag-i) :call sandwich#magicchar#t#it()
onoremap <silent> <Plug>(textobj-sandwich-tag-a) :call sandwich#magicchar#t#at()
onoremap <silent> <Plug>(textobj-sandwich-tag-i) :call sandwich#magicchar#t#it()
xnoremap <silent> <Plug>(textobj-sandwich-tagname-a) :call sandwich#magicchar#t#a()
xnoremap <silent> <Plug>(textobj-sandwich-tagname-i) :call sandwich#magicchar#t#i()
onoremap <silent> <Plug>(textobj-sandwich-tagname-a) :call sandwich#magicchar#t#a()
onoremap <silent> <Plug>(textobj-sandwich-tagname-i) :call sandwich#magicchar#t#i()
xnoremap <silent> <Plug>(textobj-sandwich-function-a) :call sandwich#magicchar#f#a()
xnoremap <silent> <Plug>(textobj-sandwich-function-ap) :call sandwich#magicchar#f#ap()
onoremap <silent> <Plug>(textobj-sandwich-function-a) :call sandwich#magicchar#f#a()
onoremap <silent> <Plug>(textobj-sandwich-function-ap) :call sandwich#magicchar#f#ap()
xnoremap <silent> <Plug>(textobj-sandwich-function-i) :call sandwich#magicchar#f#i()
xnoremap <silent> <Plug>(textobj-sandwich-function-ip) :call sandwich#magicchar#f#ip()
onoremap <silent> <Plug>(textobj-sandwich-function-i) :call sandwich#magicchar#f#i()
onoremap <silent> <Plug>(textobj-sandwich-function-ip) :call sandwich#magicchar#f#ip()
nnoremap <Plug>(sandwich-CTRL-v) 
nnoremap <Plug>(sandwich-V) V
nnoremap <Plug>(sandwich-v) v
nnoremap <Plug>(sandwich-O) O
nnoremap <Plug>(sandwich-o) o
nnoremap <Plug>(sandwich-i) i
nnoremap <Plug>(operator-sandwich-gv) gv
noremap <Plug>(operator-sandwich-g@) g@
noremap <silent> <Plug>(operator-sandwich-replace-visualrepeat) :call operator#sandwich#visualrepeat('replace')
noremap <silent> <Plug>(operator-sandwich-delete-visualrepeat) :call operator#sandwich#visualrepeat('delete')
noremap <silent> <Plug>(operator-sandwich-add-visualrepeat) :call operator#sandwich#visualrepeat('add')
nnoremap <silent> <expr> <Plug>(operator-sandwich-dot) operator#sandwich#dot()
nnoremap <silent> <expr> <Plug>(operator-sandwich-predot) operator#sandwich#predot()
onoremap <silent> <expr> <Plug>(operator-sandwich-squash-count) operator#sandwich#squash_count()
onoremap <silent> <expr> <Plug>(operator-sandwich-release-count) operator#sandwich#release_count()
onoremap <silent> <expr> <Plug>(operator-sandwich-synchro-count) operator#sandwich#synchro_count()
xnoremap <silent> <Plug>(operator-sandwich-replace-query1st) :call operator#sandwich#query1st('replace', 'x')
nnoremap <silent> <Plug>(operator-sandwich-replace-query1st) :call operator#sandwich#query1st('replace', 'n')
xnoremap <silent> <Plug>(operator-sandwich-add-query1st) :call operator#sandwich#query1st('add', 'x')
nnoremap <silent> <Plug>(operator-sandwich-add-query1st) :call operator#sandwich#query1st('add', 'n')
xnoremap <silent> <Plug>(operator-sandwich-replace-pre) :call operator#sandwich#prerequisite('replace', 'x')
nnoremap <silent> <Plug>(operator-sandwich-replace-pre) :call operator#sandwich#prerequisite('replace', 'n')
xnoremap <silent> <Plug>(operator-sandwich-delete-pre) :call operator#sandwich#prerequisite('delete', 'x')
nnoremap <silent> <Plug>(operator-sandwich-delete-pre) :call operator#sandwich#prerequisite('delete', 'n')
xnoremap <silent> <Plug>(operator-sandwich-add-pre) :call operator#sandwich#prerequisite('add', 'x')
nnoremap <silent> <Plug>(operator-sandwich-add-pre) :call operator#sandwich#prerequisite('add', 'n')
omap <silent> <Plug>(operator-sandwich-replace) <Plug>(operator-sandwich-g@)
xmap <silent> <Plug>(operator-sandwich-replace) <Plug>(operator-sandwich-replace-pre)<Plug>(operator-sandwich-gv)<Plug>(operator-sandwich-g@)
nmap <silent> <Plug>(operator-sandwich-replace) <Plug>(operator-sandwich-replace-pre)<Plug>(operator-sandwich-g@)
omap <silent> <Plug>(operator-sandwich-delete) <Plug>(operator-sandwich-g@)
xmap <silent> <Plug>(operator-sandwich-delete) <Plug>(operator-sandwich-delete-pre)<Plug>(operator-sandwich-gv)<Plug>(operator-sandwich-g@)
nmap <silent> <Plug>(operator-sandwich-delete) <Plug>(operator-sandwich-delete-pre)<Plug>(operator-sandwich-g@)
omap <silent> <Plug>(operator-sandwich-add) <Plug>(operator-sandwich-g@)
xmap <silent> <Plug>(operator-sandwich-add) <Plug>(operator-sandwich-add-pre)<Plug>(operator-sandwich-gv)<Plug>(operator-sandwich-g@)
nmap <silent> <Plug>(operator-sandwich-add) <Plug>(operator-sandwich-add-pre)<Plug>(operator-sandwich-g@)
omap <Plug>SneakPrevious <Plug>Sneak_,
omap <Plug>SneakNext <Plug>Sneak_;
xmap <Plug>SneakPrevious <Plug>Sneak_,
xmap <Plug>SneakNext <Plug>Sneak_;
nmap <Plug>SneakPrevious <Plug>Sneak_,
nmap <Plug>SneakNext <Plug>Sneak_;
omap <Plug>(SneakStreakBackward) <Plug>SneakLabel_S
omap <Plug>(SneakStreak) <Plug>SneakLabel_s
xmap <Plug>(SneakStreakBackward) <Plug>SneakLabel_S
xmap <Plug>(SneakStreak) <Plug>SneakLabel_s
nmap <Plug>(SneakStreakBackward) <Plug>SneakLabel_S
nmap <Plug>(SneakStreak) <Plug>SneakLabel_s
xmap <Plug>VSneakPrevious <Plug>Sneak_,
xmap <Plug>VSneakNext <Plug>Sneak_;
xmap <Plug>VSneakBackward <Plug>Sneak_S
xmap <Plug>VSneakForward <Plug>Sneak_s
nmap <Plug>SneakBackward <Plug>Sneak_S
nmap <Plug>SneakForward <Plug>Sneak_s
onoremap <silent> <Plug>SneakLabel_S :call sneak#wrap(v:operator, 2, 1, 2, 2)
onoremap <silent> <Plug>SneakLabel_s :call sneak#wrap(v:operator, 2, 0, 2, 2)
xnoremap <silent> <Plug>SneakLabel_S :call sneak#wrap(visualmode(), 2, 1, 2, 2)
xnoremap <silent> <Plug>SneakLabel_s :call sneak#wrap(visualmode(), 2, 0, 2, 2)
nnoremap <silent> <Plug>SneakLabel_S :call sneak#wrap('', 2, 1, 2, 2)
nnoremap <silent> <Plug>SneakLabel_s :call sneak#wrap('', 2, 0, 2, 2)
onoremap <silent> <Plug>Sneak_T :call sneak#wrap(v:operator, 1, 1, 0, 0)
onoremap <silent> <Plug>Sneak_t :call sneak#wrap(v:operator, 1, 0, 0, 0)
xnoremap <silent> <Plug>Sneak_T :call sneak#wrap(visualmode(), 1, 1, 0, 0)
xnoremap <silent> <Plug>Sneak_t :call sneak#wrap(visualmode(), 1, 0, 0, 0)
nnoremap <silent> <Plug>Sneak_T :call sneak#wrap('', 1, 1, 0, 0)
nnoremap <silent> <Plug>Sneak_t :call sneak#wrap('', 1, 0, 0, 0)
onoremap <silent> <Plug>Sneak_F :call sneak#wrap(v:operator, 1, 1, 1, 0)
onoremap <silent> <Plug>Sneak_f :call sneak#wrap(v:operator, 1, 0, 1, 0)
xnoremap <silent> <Plug>Sneak_F :call sneak#wrap(visualmode(), 1, 1, 1, 0)
xnoremap <silent> <Plug>Sneak_f :call sneak#wrap(visualmode(), 1, 0, 1, 0)
nnoremap <silent> <Plug>Sneak_F :call sneak#wrap('', 1, 1, 1, 0)
nnoremap <silent> <Plug>Sneak_f :call sneak#wrap('', 1, 0, 1, 0)
onoremap <silent> <Plug>SneakRepeat :call sneak#wrap(v:operator, sneak#util#getc(), sneak#util#getc(), sneak#util#getc(), sneak#util#getc())
onoremap <silent> <Plug>Sneak_S :call sneak#wrap(v:operator, 2, 1, 2, 1)
onoremap <silent> <Plug>Sneak_s :call sneak#wrap(v:operator, 2, 0, 2, 1)
xnoremap <silent> <Plug>Sneak_S :call sneak#wrap(visualmode(), 2, 1, 2, 1)
xnoremap <silent> <Plug>Sneak_s :call sneak#wrap(visualmode(), 2, 0, 2, 1)
nnoremap <silent> <Plug>Sneak_S :call sneak#wrap('', 2, 1, 2, 1)
nnoremap <silent> <Plug>Sneak_s :call sneak#wrap('', 2, 0, 2, 1)
onoremap <silent> <Plug>(fzf-maps-o) :call fzf#vim#maps('o', 0)
xnoremap <silent> <Plug>(fzf-maps-x) :call fzf#vim#maps('x', 0)
nnoremap <silent> <Plug>(fzf-maps-n) :call fzf#vim#maps('n', 0)
nmap <PageUp> <Plug>(SmoothieBackwards)
nmap <S-Up> <Plug>(SmoothieBackwards)
nmap <PageDown> <Plug>(SmoothieForwards)
nmap <S-Down> <Plug>(SmoothieForwards)
nnoremap <silent> <Plug>(SmoothieBackwards) :call smoothie#backwards() 
nnoremap <silent> <Plug>(SmoothieForwards) :call smoothie#forwards()  
nnoremap <silent> <Plug>(SmoothieUpwards) :call smoothie#upwards()   
nnoremap <silent> <Plug>(SmoothieDownwards) :call smoothie#downwards() 
nnoremap <silent> <Plug>(startify-open-buffers) :call startify#open_buffers()
xnoremap <Plug>ColorFgBg :ColorSwapFgBg
nnoremap <Plug>ColorFgBg :ColorSwapFgBg
xnoremap <Plug>ColorContrast :ColorContrast
nnoremap <Plug>ColorContrast :ColorContrast
xnoremap <Plug>Colorizer :ColorHighlight
nnoremap <Plug>Colorizer :ColorToggle
onoremap <silent> <Plug>(coc-funcobj-a) :call coc#rpc#request('selectFunction', [v:false, ''])
onoremap <silent> <Plug>(coc-funcobj-i) :call coc#rpc#request('selectFunction', [v:true, ''])
vnoremap <silent> <Plug>(coc-funcobj-a) :call coc#rpc#request('selectFunction', [v:false, visualmode()])
vnoremap <silent> <Plug>(coc-funcobj-i) :call coc#rpc#request('selectFunction', [v:true, visualmode()])
nnoremap <silent> <Plug>(coc-cursors-position) :call coc#rpc#request('cursorsSelect', [bufnr('%'), 'position', 'n'])
nnoremap <silent> <Plug>(coc-cursors-word) :call coc#rpc#request('cursorsSelect', [bufnr('%'), 'word', 'n'])
vnoremap <silent> <Plug>(coc-cursors-range) :call coc#rpc#request('cursorsSelect', [bufnr('%'), 'range', visualmode()])
nnoremap <Plug>(coc-refactor) :call       CocActionAsync('refactor')
nnoremap <Plug>(coc-command-repeat) :call       CocAction('repeatCommand')
nnoremap <Plug>(coc-float-jump) :call       coc#util#float_jump()
nnoremap <Plug>(coc-float-hide) :call       coc#util#float_hide()
nnoremap <Plug>(coc-fix-current) :call       CocActionAsync('doQuickfix')
nnoremap <Plug>(coc-openlink) :call       CocActionAsync('openLink')
nnoremap <Plug>(coc-references) :call       CocAction('jumpReferences')
nnoremap <Plug>(coc-type-definition) :call       CocAction('jumpTypeDefinition')
nnoremap <Plug>(coc-implementation) :call       CocAction('jumpImplementation')
nnoremap <Plug>(coc-declaration) :call       CocAction('jumpDeclaration')
nnoremap <Plug>(coc-definition) :call       CocAction('jumpDefinition')
nnoremap <Plug>(coc-diagnostic-prev-error) :call       CocActionAsync('diagnosticPrevious', 'error')
nnoremap <Plug>(coc-diagnostic-next-error) :call       CocActionAsync('diagnosticNext',     'error')
nnoremap <Plug>(coc-diagnostic-prev) :call       CocActionAsync('diagnosticPrevious')
nnoremap <Plug>(coc-diagnostic-next) :call       CocActionAsync('diagnosticNext')
nnoremap <Plug>(coc-diagnostic-info) :call       CocActionAsync('diagnosticInfo')
nnoremap <Plug>(coc-format) :call       CocActionAsync('format')
nnoremap <Plug>(coc-rename) :call       CocActionAsync('rename')
nnoremap <Plug>(coc-codeaction) :call       CocActionAsync('codeAction',         '')
vnoremap <Plug>(coc-codeaction-selected) :call       CocActionAsync('codeAction',         visualmode())
vnoremap <Plug>(coc-format-selected) :call       CocActionAsync('formatSelected',     visualmode())
nnoremap <Plug>(coc-codelens-action) :call       CocActionAsync('codeLensAction')
nnoremap <Plug>(coc-range-select) :call       CocAction('rangeSelect',     '', v:true)
vnoremap <Plug>(coc-range-select-backward) :call       CocAction('rangeSelect',     visualmode(), v:false)
vnoremap <Plug>(coc-range-select) :call       CocAction('rangeSelect',     visualmode(), v:true)
map <F2> :Lexplore
vnoremap <S-Tab> <gv
nnoremap <Down> :echoe "Use j"
nnoremap <Up> :echoe "Use k"
nnoremap <Right> :echoe "Use l"
nnoremap <Left> :echoe "Use h"
map <F7> mzgg=G`z
map <F4> :tabedit $HOME/.config/vim/vimrc
map <F3> :set spell!
map <F5> :e %
inoremap <silent> <expr>  pumvisible() ? coc#_select_confirm() : "\u\"
inoremap  u
inoremap  +
inoremap <silent> <expr> " coc#_insert_key('request', '9c7099f9-6940-11ea-8165-43fc0d5be21c')
inoremap <silent> <expr> ' coc#_insert_key('request', '9c7099f8-6940-11ea-8165-43fc0d5be21c')
inoremap <silent> <expr> ( coc#_insert_key('request', '9c7099f0-6940-11ea-8165-43fc0d5be21c')
inoremap <silent> <expr> ) coc#_insert_key('request', '9c7099f1-6940-11ea-8165-43fc0d5be21c')
inoremap <silent> <expr> < coc#_insert_key('request', '9c7099f6-6940-11ea-8165-43fc0d5be21c')
inoremap <silent> <expr> > coc#_insert_key('request', '9c7099f7-6940-11ea-8165-43fc0d5be21c')
xnoremap <silent> î :call multiple_cursors#select_all("v", 0)
nnoremap <silent> î :call multiple_cursors#select_all("n", 1)
inoremap <silent> <expr> [ coc#_insert_key('request', '9c7099f2-6940-11ea-8165-43fc0d5be21c')
inoremap <silent> <expr> ] coc#_insert_key('request', '9c7099f3-6940-11ea-8165-43fc0d5be21c')
inoremap <silent> <expr> ` coc#_insert_key('request', '9c7099fa-6940-11ea-8165-43fc0d5be21c')
inoremap jj 
cmap w!! w !sudo tee % >/dev/null
inoremap <silent> <expr> { coc#_insert_key('request', '9c7099f4-6940-11ea-8165-43fc0d5be21c')
inoremap <silent> <expr> } coc#_insert_key('request', '9c7099f5-6940-11ea-8165-43fc0d5be21c')
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set background=dark
set backspace=indent,start,eol
set backupdir=~/.cache/vim/backup
set backupskip=/tmp/*,/tmp/*,/tmp/*,/tmp/*,*.re,*.rei
set belloff=all
set clipboard=unnamed
set directory=~/.cache/vim/swap//
set display=truncate
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set fillchars=vert:┃,fold:·
set foldlevelstart=99
set formatoptions=tcqjn
set grepprg=rg\ --vimgrep
set helplang=en
set hidden
set highlight=8:SpecialKey,~:EndOfBuffer,@:NonText,d:Directory,e:ErrorMsg,i:IncSearch,l:Search,m:MoreMsg,M:ModeMsg,n:LineNr,N:CursorLineNr,r:Question,s:StatusLine,S:StatusLineNC,c:VertSplit,t:Title,v:Visual,V:VisualNOS,w:WarningMsg,W:WildMenu,f:Folded,F:FoldColumn,A:DiffAdd,C:DiffChange,D:DiffDelete,T:DiffText,>:SignColumn,-:Conceal,B:SpellBad,P:SpellCap,R:SpellRare,L:SpellLocal,+:Pmenu,=:PmenuSel,x:PmenuSbar,X:PmenuThumb,*:TabLine,#:TabLineSel,_:TabLineFill,!:CursorColumn,.:CursorLine,o:ColorColumn,q:QuickFixLine,z:StatusLineTerm,Z:StatusLineTermNC,@:Conceal,N:DiffText,c:LineNr
set ignorecase
set incsearch
set iskeyword=@,48-57,_,192-255,-
set nojoinspaces
set langnoremap
set nolangremap
set laststatus=2
set lazyredraw
set listchars=nbsp:⦸,tab:▷┅,extends:»,precedes:«,trail:���
set nomodeline
set mouse=a
set nrformats=bin,hex
set ruler
set runtimepath=~/.config/vim,~/.cache/vim/packages/coc.nvim,~/.cache/vim/packages/splitjoin.vim,~/.cache/vim/packages/indentLine,~/.cache/vim/packages/Colorizer,~/.cache/vim/packages/securemodelines,~/.cache/vim/packages/editorconfig-vim,~/.cache/vim/packages/vim-smartinput,~/.cache/vim/packages/vim-startify,~/.cache/vim/packages/vim-bbye,~/.cache/vim/packages/vim-smoothie,~/.cache/vim/packages/vim-multiple-cursors,~/.cache/vim/packages/lessspace.vim,~/.cache/vim/packages/markdown-preview.nvim,~/.local/opt/fzf,~/.cache/vim/packages/fzf.vim,~/.cache/vim/packages/lightline.vim,~/.cache/vim/packages/vim-highlightedyank,~/.cache/vim/packages/vim-devicons,~/.cache/vim/packages/vim-rooter,~/.cache/vim/packages/vim-sneak,~/.cache/vim/packages/vim-orgmode,~/.cache/vim/packages/rust.vim,~/.cache/vim/packages/vim-rust-syntax-ext,~/.cache/vim/packages/vim-polyglot,~/.cache/vim/packages/just-vim,~/.cache/vim/packages/Revolution.vim,~/.cache/vim/packages/neodark.vim,~/.cache/vim/packages/vim-synthwave84,~/.cache/vim/packages/vim-nightfly-guicolors,~/.cache/vim/packages/wal.vim,~/.cache/vim/packages/candid.vim,~/.cache/vim/packages/gruvbox-material,~/.cache/vim/packages/vim-colors-xcode,~/.cache/vim/packages/vim-janah,~/.cache/vim/packages/vim-color-spring-night,~/.cache/vim/packages/vim-repeat,~/.cache/vim/packages/vim-easy-align,~/.cache/vim/packages/vim-sandwich,~/.cache/vim/packages/vim-commentary,~/.cache/vim/packages/vim-sort-motion,~/.cache/vim/packages/vim-system-copy,~/.cache/vim/packages/vim-textobj-comment,~/.cache/vim/packages/vim-textobj-function,~/.cache/vim/packages/vim-textobj-user,~/.cache/vim/packages/line-targets.vim,~/.cache/vim/packages/targets.vim,~/.config/vim/after,/usr/share/vim,/usr/share/vim/vim81,~/.config/nvim,~/.vim/after,/usr/share/vim/vimfiles/after,/usr/share/vim/vim81,/usr/share/vim/vimfiles,~/.cache/vim/packages/indentLine/after,~/.cache/vim/packages/rust.vim/after,~/.cache/vim/packages/vim-rust-syntax-ext/after,~/.cache/vim/packages/vim-polyglot/after,~/.cache/vim/packages/vim-sandwich/after,~/.cache/vim/packages/vim-textobj-function/after,~/.vim
set scrolloff=3
set shiftround
set shiftwidth=4
set shortmess=filnxSAOTWaotI
set showbreak=↳\ 
set showmatch
set sidescrolloff=3
set smartcase
set smarttab
set softtabstop=-1
set spellcapcheck=
set splitbelow
set splitright
set statusline=%f%h%m%r\ [%{&ff}]\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P
set swapsync=
set switchbuf=usetab
set synmaxcol=200
set tabline=%!lightline#tabline()
set tabstop=4
set termguicolors
set textwidth=120
set title
set ttimeout
set ttimeoutlen=100
set undodir=~/.cache/vim/undo
set undofile
set updatecount=80
set updatetime=300
set viewdir=~/.cache/vim/view
set viewoptions=cursor,folds
set viminfo='100,<50,s10,h,n$HOME/.cache/vim/viminfo
set virtualedit=block
set visualbell
set whichwrap=b,h,l,s,<,>,[,],~
set wildcharm=26
set wildignore=*.o,*.rej
set wildmenu
set wildmode=longest:full,full
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/shell.d
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd rc.d/005-application-setting.sh
edit rc.d/005-application-setting.sh
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=inc
setlocal conceallevel=2
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'sh'
setlocal filetype=sh
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=indent
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcqjn
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetShIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,0=then,0=do,0=else,0=elif,0=fi,0=esac,0=done,0=end,),0=;;,0=;&,0=fin,0=fil,0=fip,0=fir,0=fix
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,-
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
set list
setlocal list
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal nomodeline
setlocal modifiable
setlocal nrformats=bin,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal noshortname
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=-1
setlocal nospell
setlocal spellcapcheck=
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%{lightline#link()}%#LightlineLeft_active_0#%(\ %{lightline#mode()}\ %)%{(&paste)?\"|\":\"\"}%(\ %{&paste?\"PASTE\":\"\"}\ %)%#LightlineLeft_active_0_1#%#LightlineLeft_active_1#%(\ %R\ %)%{(&readonly)&&(1||(&modified||!&modifiable))?\"|\":\"\"}%(\ %t\ %)%{(&modified||!&modifiable)?\"|\":\"\"}%(\ %M\ %)%#LightlineLeft_active_1_2#%#LightlineMiddle_active#%=%#LightlineRight_active_2_3#%#LightlineRight_active_2#%(\ %{&ff}\ %)%{1||1?\"|\":\"\"}%(\ %{&fenc!=#\"\"?&fenc:&enc}\ %)%{1?\"|\":\"\"}%(\ %{&ft!=#\"\"?&ft:\"no\ ft\"}\ %)%#LightlineRight_active_1_2#%#LightlineRight_active_1#%(\ %3p%%\ %)%#LightlineRight_active_0_1#%#LightlineRight_active_0#%(\ %3l:%-2v\ %)
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=200
if &syntax != 'sh'
setlocal syntax=sh
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=120
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 16 - ((15 * winheight(0) + 44) / 88)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
16
normal! 0
tabnext 1
badd +0 rc.d/005-application-setting.sh
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxSAOTWaotI
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
