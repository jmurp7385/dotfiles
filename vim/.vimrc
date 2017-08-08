if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'valloric/youcompleteme'
Plug 'godlygeek/tabular'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-rails'
Plug 'mattn/emmet-vim'
Plug 'vim-ruby/vim-ruby'
Plug 'raimondi/delimitmate'
Plug 'flazz/vim-colorschemes'
Plug 'elzr/vim-json'
Plug 'moll/vim-node'
Plug 'bling/vim-airline'
Plug 'othree/html5.vim'
Plug 'thaerkh/vim-workspace'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-sensible'
Plug 'yuttie/comfortable-motion.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'hail2u/vim-css3-syntax'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'klen/python-mode'
Plug 'tpope/vim-bundler'
call plug#end()

colorscheme monokai

"NERD Commenter stuff

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaltAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"nerd tree

"autocmd vimenter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"fugitive vim

autocmd QuickFixCmdPost *grep* cwindow

"syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"workspace

let g:workspace_autosave_always = 1

"indentline
let g:indentLine_setColors = 0

"comfortable motion
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
