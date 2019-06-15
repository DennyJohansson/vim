""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" BASED ON :: Ben Bleything's Vim Setup
""" Based on the work of many others. See README.rdoc for credits.
"""
""" Git Hubs: http://github.com/bleything/dotvim
""" Internet Electronic Mail: ben@bleything.net
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" P L U G I N S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'
Plugin 'mhartington/oceanic-next'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'ap/vim-css-color'
Plugin 'prettier/vim-prettier'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" K E Y   B I N D I N G S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=',' " set leader to ,

" format paragraphs (72 columns)
map ^^ {!}par w72qrg<CR>

" one-stroke window maximizing
map <C-H> <C-W>h<C-W><BAR>
map <C-L> <C-W>l<C-W><BAR>
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" quick buffer switching
map <leader>[ :bprevious<CR>
map <leader>] :bnext<CR>

" shortcut to compile/run the current file
map <leader>r :w<CR>:make %<CR>

" shortcut to strip trailing whitespace
map <leader>s :s/\s\+$//g<CR>

" fold helpers:
"   Tab: toggle fold state
"   Shift-Tab: toggle state of outermost fold
"   Ctrl-Tab: open all folds
map <TAB> za
map <S-TAB> zA
map <C-TAB> zR
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" E D I T I N G   O P T I O N S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on       " turn on syntax highlighting
set number      " show line numbers
set showbreak=+ " display a + at the beginning of a wrapped line
set showmatch   " flash the matching bracket on inserting a )]} etc

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

""" FIXME: everything works as expected without these, I'm sure
"""        that I'm just missing something
"set cindent    " c-style language indentation
"set autoindent " automatically indent new lines
"set smartindent " automatically indent new lines

" for most code, use 4 space indents. specific filetypes are overridden
" in filetypes.vimrc
set softtabstop=4 " most of the time, we want a softtabstop of 4
set tabstop=4     " display tabs as 4 characters wide
set shiftwidth=4  " shift by 4 spaces when using >> and <<, etc
set expandtab     " no tabs, just spaces kthx.

" Using autocmd for this allows it to be reset every time you open a
" file, which keeps overrides from being persistent
autocmd FileType * set softtabstop=4 tabstop=4 shiftwidth=4 expandtab

set list                     " show whitespace
set listchars=tab:»·,trail:· " show tabs and trailing spaces
set listchars+=extends:»     " show a » when a line goes off the right
                             " edge of the screen
set listchars+=precedes:«    " show a « when a line goes off the left
                             " edge of the screen

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" F O L D I N G   O P T I O N S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable        " enable folding
set foldmethod=indent " use the syntax definitions' folding
set foldlevelstart=99 " start with all folds open when switching buffers
set foldcolumn=3      " adds two columns of fold status on the left-hand
                      " side of the screen

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" S E A R C H   O P T I O N S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase " makes search patterns case-insensitive by default
set smartcase  " overrides ignorecase when the pattern contains
               " upper-case characters
set incsearch  " incremental search. 'nuf said

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" S W A P   A N D   U N D O   O P T I O N S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set directory=~/.vim/swapfiles,/var/tmp,/tmp,.

" enable persistent undo
if has("persistent_undo")
    set undofile
    set undodir=~/.vim/undofiles,/var/tmp,/tmp,.
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" F I L E T Y P E   O P T I O N S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use filetype plugins to determine indent settings
filetype plugin indent on

" ruby and yaml files are indented by two
autocmd FileType ruby,rdoc,cucumber,yaml set softtabstop=2 tabstop=2 shiftwidth=2

" Gemfile, Isolate, Vagrantfile and config.ru are ruby
autocmd BufNewFile,BufRead Gemfile     setfiletype ruby
autocmd BufNewFile,BufRead Isolate     setfiletype ruby
autocmd BufNewFile,BufRead Vagrantfile setfiletype ruby
autocmd BufNewFile,BufRead config.ru   setfiletype ruby

" set up compiler for ruby files
autocmd FileType ruby compiler ruby

" don't show whitespace in help files
autocmd FileType help set nolist

" twiki files
autocmd BufNewFile,BufRead *.twiki set filetype=twiki

" set filetype on config files for vim, mutt, and bash
autocmd BufNewFile,BufRead ~/.vim/*  setfiletype vim
autocmd BufNewFile,BufRead ~/.mutt/* setfiletype muttrc
autocmd BufNewFile,BufRead ~/.bash/* setfiletype sh
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" W I N D O W   O P T I O N S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler          " shows cursor position in the lower right
set showcmd        " shows incomplete command to the left of the ruler
set winminheight=0 " allow windows to be 0 lines tall
set winminwidth=0  " allow windows to be 0 lines wide
set laststatus=2   " always show statusline

" set up statusline, ends up looking like this:
"
"   [1] window.vimrc [Preview] [vim,+]          0x00 @ l22 c51 (88%)
"
set statusline=
set statusline+=%n:\                      " buffer number
set statusline+=%f                        " filename
set statusline+=%<                        " truncate here if necessary
set statusline+=%10w                      " displays [Preview] if it is
set statusline+=\ [                       " fix spacing, open bracket
set statusline+=%{strlen(&ft)?&ft:'none'} " filetype
set statusline+=%M                        " + if modified, - if r/o
set statusline+=]                         " close bracket
set statusline+=%=                        " right-align remainder
set statusline+=0x%02B\                   " character hex value
set statusline+=@\ L%l\ C%c\ (%P)\        " position in file

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" G U I   O P T I O N S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    set mouse=a                 " use mouse when possible
    set guifont=SourceCodePro-Regular:h14


    " set default window size 170x48
    set columns=999
    set lines=999

    " GUI option string.  Values:
    "   a: visual-mode selections go to the clipboard
    "   A: modeless selections go to the clipboard
    "   c: don't pop up windows; use the console for dialog boxes and such
    "   e: use GUI tab bar instead of text tab bar
    set guioptions=aAce
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
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" P L U G I N   O P T I O N S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""" Prettier
let g:prettier#config#tab_width = 1
let g:prettier#config#use_tabs = 'true'

""" Ale
" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'scss': ['prettier']
\}
" set this to 1 to fix files when you save
let g:ale_fix_on_save = 1
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
""" Oceanic next
" Theme
 syntax enable
" for vim 7
 set t_Co=256

" for vim 8
 if (has("termguicolors"))
  set termguicolors
 endif

colorscheme OceanicNext
let g:airline_theme='oceanicnext'
""" bufexplorer
let g:bufExplorerDetailedHelp=1     " show full help text by default
" let g:bufExplorerShowRelativePath=1 " use relative paths
let g:bufExplorerShowUnlisted=1     " display unlisted buffers

""" NERDCommenter
let NERDCreateDefaultMappings=0 " disable default mappings
let NERDMenuMode=0              " disable menu
let NERDSpaceDelims=1           " place spaces after comment chars
let NERDDefaultNesting=0        " don't recomment commented lines

map <leader>cc <plug>NERDCommenterToggle
map <leader>cC <plug>NERDCommenterSexy
map <leader>cu <plug>NERDCommenterUncomment

""" NERDTree
map <leader>d :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeChDirMode=2
" How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" How can I open NERDTree automatically when vim starts up on opening a directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""" ack
map <leader>ack :Ack
map <leader>an :cn<cr>
map <leader>ap :cp<cr>
""" UltiSnips YCM Supertab
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

""" YCM
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
