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
source $HOME/.vim/plugins
source $HOME/.vim/basic
source $HOME/.vim/bindings
source $HOME/.vim/window
source $HOME/.vim/editing
source $HOME/.vim/filetypes

if has("gui_running")
    source $HOME/.vim/gui
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" S E T T I N G S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" uncomment to use real tabs
set autoindent expandtab tabstop=2 softtabstop=2 shiftwidth=2
" let g:javascript_plugin_jsdoc = 1
" let g:javascript_plugin_ngdoc = 1
" let g:javascript_plugin_flow = 1
" allow code folding for javascript
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
" safe write off for hotreloading
:set backupcopy=yes
" easy buffer menu , by using tab in terminal mode
set wildchar=<Tab> wildmenu wildmode=full
" easy reload vimrc
nmap ,s :so ~/.vim/vimrc
