" big thanks
"   https://github.com/skwp/dotfiles/blob/master/vimrc
"   http://items.sjbach.com/319/configuring-vim-right
"   http://vimdoc.sourceforge.net/htmldoc/options.html
"     - vim's documentation, in a browser :D
"   https://github.com/github/gitignore
"     - helped with the 'wildignore' option
"   http://vimbits.com/

set nocompatible " use vim settings, don't worry about vi compatibility

" plugin manager plugin (https://github.com/sunaku/vim-unbundle)
runtime bundle/unbundle/unbundle.vim
runtime macros/matchit.vim " enable matchit, a plugin included with vim

" {{{ general

filetype plugin indent on                                   " load plugin/indent files for the detected filetype (see `:help filetype` for more info)
syntax on                                                   " turn on syntax highlighting
set autoread                                                " automatically read files that have been changed outside the editor
set backspace=indent,eol,start                              " allow deleting any characters in insert mode (see `:help 'backspace'`)
set completeopt+=longest                                    " complete the longest common match (instead of the first one) before showing all matches
set encoding=utf-8                                          " use utf-8 encoding by defualt (see `:help encoding` for more info)
set expandtab smarttab tabstop=2 softtabstop=2 shiftwidth=2 " indent with two spaces when the tab key is pressed
set fillchars="stl:c ,stlnc:c ,vert:c ,fold:c ,diff:c "     " don't use extra characters in various places in the ui (see `:help fillchars`)
set foldmethod=marker                                       " fold text based on the default marker (see `:help foldmarker`)
set formatoptions="acjnoqr"                                 " format text as it's typed (see `:help fo-table` for an explanation of the options
set helpheight=999                                          " when viewing the help documentation use a full-sized window (instead of 1/2 the size)
set hidden                                                  " allow hidden buffers (buffers not attached to a window) without warnings
set hlsearch incsearch                                      " highlight search terms dynamically as they are typed and highlight matches
set ignorecase smartcase                                    " case sensitive searches only when capitals are present
set mouse=a                                                 " enable the mouse in all modes
set noswapfile nobackup nowritebackup                       " turn off swap/backup files
set nowrap                                                  " don't wrap text
set scrolloff=999                                           " keep the cursor in the middle of the text (except when on the top and bottom)
set spellcapcheck=                                          " don't tell me words that aren't capitalized are misspelled
set ttimeoutlen=0                                           " don't wait for extra keys to be pressed before redrawing the screen
set virtualedit=all                                         " let the cursor move anywhere
" tab complete like zsh and ignore compiled/temporary files when completing
set wildmenu wildmode=full wildignore=*.o,*.obj,*.so,*.a,*.py[co],*~,*.hi
set wildignore+=.sass-cache,node_modules
set number
let mapleader = " "

if has('clipboard')
  set clipboard=unnamed,unnamedplus " make copied text available to the OS' clipboard
endif

" general }}}

" {{{ filetype specific

autocmd BufWritePre * :%substitute/\s\+$//e " strip trailing whitespace before saving any file
" regenerate the 'tags' file when saving (if it exists in the current directory)
autocmd BufWritePost * if filereadable('tags') | :execute ':silent !ctags --recurse &> /dev/null &' | :redraw! | endif

autocmd FileType diff,gitcommit                   setlocal foldmethod=expr foldexpr="0" " don't fold text in diff files (this doesn't affect fugitive diffs)
autocmd FileType help                             nnoremap q :quit<cr>
autocmd FileType markdown,gitcommit,cucumber,mail setlocal spell                        " spellcheck these files by default
autocmd FileType markdown                         setlocal textwidth=72                 " wrap markdown files at 72 characters
autocmd FileType qf,tagbar                        setlocal cursorline                   " highlight the current line in these filetypes
autocmd FileType vim,help                         setlocal keywordprg=:help             " use the `:help` command to show help in these files
autocmd FileType html,php                         imap <leader><tab> <C-Y>,
" filetype specific }}}

" {{{ plugin specific

" powerline statusline plugin (https://github.com/Lokaltog/vim-powerline)
set laststatus=2 " always show the status line

" CtrlP file finder/opener (https://github.com/kien/ctrlp.vim)
" C-x C-f to fuzzy-find files and C-x b to fuzzy-find open buffers (from emacs)
nnoremap <c-x>b :CtrlPBuffer<cr>
let g:ctrlp_by_filename=1 " search by filename, instead of the full path
let g:ctrlp_custom_ignore={ 'dir': 'Music$\|Videos$\|Pictures$\|Documents$\|tmp$\|.git$\|.hg$' } " ignore content/version control directories
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:25' " show more matches
let g:ctrlp_show_hidden=1 " search hidden files and directories too
let g:ctrlp_working_path_mode=0 " don't change the current working directory

" solarized colorscheme (https://github.com/altercation/vim-colors-solarized)
set background=dark
" colorscheme jellybeans
colorscheme hybrid

" syntastic syntax checker (https://github.com/scrooloose/syntastic)
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_mode_map = { 'passive_filetypes': ['html'] }

" the silver searcher wrapper plugin (https://github.com/rking/ag.vim)
let g:agprg="ag --column --smart-case" " ignore case if there aren't any capitals in the search terms

" airline statusline plugin (https://github.com/bling/vim-airline)
let g:airline_left_sep=''
let g:airline_right_sep=''

" reveal the current file in a file browser (https://github.com/scrooloose/nerdtree)
noremap <silent> <leader>f :NERDTreeFind<cr>

" show the current file's functions (https://github.com/majutsushi/tagbar)
noremap <silent> <leader>t :TagbarOpenAutoClose<cr>

" plugin specific }}}

" {{{ other mappings/abbreviations

set pastetoggle=<f8>              " toggle paste mode with f8 (see `:help paste`)
autocmd InsertLeave * set nopaste " disable paste mode when leaving insert mode

" disable ex mode; I usually toggle this on accident and don't otherwise use it
nnoremap Q <nop>

nnoremap <leader>n :NERDTreeToggle<cr>

" close all foldes, and open/jump to the next
noremap <space> zMzjzo

" cancel input in command mode
cnoremap <c-g> <c-c>

" `Y` now copies text from the current spot until the end of the line, instead of the whole line
" thanks: http://vimbits.com/bits/11
noremap Y y$

" alias frequently mistyped commands
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq

" easy split navigation (thanks: http://vimbits.com/bits/10)
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

" f12 to toggle line/column highlighting
noremap <silent> <f12> :setlocal cursorline! cursorcolumn!<cr>

" blanks a line (clears it).  This works in normal and visual mode
" NOTE: the line that was cleared can be pasted (is in the " and 1 registers)
noremap <silent> <leader>b :normal cc<cr>

" browse the current directory in vim
noremap <silent> <leader>e :edit $PWD<cr>

" browse changes in a git repository in the current directory
" see `man tig` for more info
noremap <silent> <leader>g :silent !tig<cr>:redraw!<cr>

" clear search highlights
noremap <silent> <leader>h :nohlsearch<cr>

" toggle spellcheck (see `:help spell`)
noremap <silent> <leader>l :set spell! spell?<cr>

" show all registers, useful for when looking for strings you deleted awhile ago
noremap <silent> <leader>r :registers<cr>

" horizontally split the window (uses the current buffer)
noremap <silent> <leader>s :split<cr>

" vertically split the window (uses the current buffer)
noremap <silent> <leader>v :vsplit<cr>

" smash the ']' and '\' keys in normal mode to save your file
noremap <silent> \] :update<cr>
noremap <silent> ]\ :update<cr>

" other mappings/abbreviations }}}
"
if empty(glob('~/.vim/autoload/plug.vim'))
  !mkdir -p ~/.vim/autoload/
  !curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/bundle/')

" colorschemes
Plug 'altercation/vim-colors-solarized'

" extra filetype support
Plug 'kchmck/vim-coffee-script'
Plug 'wavded/vim-stylus'
Plug 'leshill/vim-json'

Plug 'ervandew/supertab'       " tab completion
Plug 'godlygeek/tabular'       " aligning text
Plug 'kien/ctrlp.vim'          " fuzzy file finder
Plug 'losingkeys/vim-stopsign' " expand 'dbg' to statements that stop your program
Plug 'rking/ag.vim'            " use the 'ag' search tool
Plug 'scrooloose/syntastic'    " syntax checking
Plug 'sickill/vim-pasta'       " enhances the default paste command ('p')
Plug 'tpope/vim-commentary'    " comment out code
Plug 'tpope/vim-endwise'       " add 'end' to code blocks
Plug 'tpope/vim-fugitive'      " use 'git'
Plug 'tpope/vim-rails'         " enhance vim for rails projects
Plug 'tpope/vim-repeat'        " allow plugins to repeat actions with '.'
Plug 'tpope/vim-rsi'           " make insert-mode more like readline
Plug 'tpope/vim-scriptease'    " useful plugin development tools
Plug 'tpope/vim-surround'      " support handling surrounding quotes/brackets/etc
Plug 'tpope/vim-vinegar'       " enhance the default file browser, add '-' to go up directories
Plug 'scrooloose/nerdtree'     " NERDTree
Plug 'joshtronic/php.vim'      " Vim PHP Highlighting and completion
Plug 'dsawardekar/wordpress'   " Vim Wordpress completion and helpers
Plug 'mattn/emmet-vim'         " Emmet xen coding plugin
Plug 'jiangmiao/auto-pairs'    " Autoclose pairs and stuff
Plug 'tpope/vim-haml'          " Haml, sass etc.
Plug 'shawncplus/phpcomplete.vim'  " PHPComplete
Plug 'digitaltoad/vim-jade'      " Jade syntax highlighting
Plug 'jelera/vim-javascript-syntax' " Javascript Syntax Highlighting
Plug 'slim-template/vim-slim' " Slim highlighting and helpers
Plug 'mileszs/ack.vim' " Ack
call plug#end()

runtime macros/matchit.vim " enable matchit, a plugin included with vim

