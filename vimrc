""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" BASED ON :: Ben Bleything's Vim Setup
""" Based on the work of many others. See README.rdoc for credits.
"""
""" Git Hubs: http://github.com/bleything/dotvim
""" Internet Electronic Mail: ben@bleything.net
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source $HOME/.vim/vundle
source $HOME/.vim/basic
source $HOME/.vim/bindings
source $HOME/.vim/window
source $HOME/.vim/editing
source $HOME/.vim/filetypes
source $HOME/.vim/plugins
source $HOME/.vim/coc

if has("gui_running")
    source $HOME/.vim/gui
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" S E T T I N G S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" uncomment to use real tabs
":set autoindent expandtab tabstop=8 softtabstop=2 shiftwidth=2
" use spaces with tab key
" set tabstop=8 softtabstop=8 expandtab shiftwidth=8
" smarttab
" let g:javascript_plugin_jsdoc = 1"
" let g:javascript_plugin_ngdoc = 1
" let g:javascript_plugin_flow = 1
" allow code folding for javascript
" augroup javascript_folding
    " au!
    " au FileType javascript setlocal foldmethod=syntax
" augroup END
" safe write off for hotreloading
" set backupcopy=yes
" set backupdir-=.
" set backupdir^=~/tmp,/tmp
" set swapfile
" set undodir=~/tmp,/tmp
" easy buffer menu , by using tab in terminal mode
set wildchar=<Tab> wildmenu wildmode=full
" hide tilde signs on blank lines, this is great paired with :Goyo
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
set foldmethod=manual
augroup jsFolds
  autocmd!
  " autocmd FileType javascript,typescript,json syntax region braceFold start="{" end="}" transparent fold
  " autocmd FileType javascript,typescript,json syntax region bracketFold start="\[" end="\]" transparent fold
  " autocmd FileType javascript,typescript,json syntax sync fromstart
  " autocmd FileType javascript,typescript,json set foldmethod=syntax
  let javaScript_fold=1
  set foldlevelstart=99
  set foldlevel=99
  autocmd FileType javascript,typescript setlocal foldmethod=expr
  autocmd FileType javascript,typescript setlocal foldexpr=JSFolds()
  function! JSFolds()
    let thisline = getline(v:lnum)
    if thisline =~? '\v^\s*$'
      return '-1'
    endif
    if thisline =~ '^import.*$'
      return 1
    else
      return indent(v:lnum) / &shiftwidth
    endif
  endfunction
augroup end
