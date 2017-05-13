" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

" https://gist.github.com/rocarvaj/2513367
" disable vi compatibility (emulation of old bugs)
set nocompatible

"NERDTree plugin configuration.
"open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree

"open a NERDTree automatically when vim starts up if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif

"map a specific key or shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>

"close vim if the only window left open is a NERDTree
"http://stackoverflow.com/questions/2066590/automatically-quit-vim-if-nerdtree-is-last-and-only-buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"cursor always starts in the NERDTree window
"http://stackoverflow.com/questions/1447334/how-do-you-add-nerdtree-to-your-vimrc
autocmd VimEnter * wincmd p

"Easy window navigation, Just use CTRL + hjkl for navigation inplace of CTRL +
"W
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" End of nerdTree Configuration

" Tab Settings
" http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
set tabstop=4 		" show existing tab with 4 spaces width
set shiftwidth=4 	" when indenting with '>', use 4 spaces width
set expandtab 		" On pressing tab, insert 4 spaces
set softtabstop=4   " Sets the number of columns for a TAB."
set cursorline      " Show visual line under the curson.
set showmatch       " show the matching part of the pair [], {}, ()
" Only do this part when compiled with support for autocommands.
if has("autocmd")
	" Use filetype detection and file-based automatic indenting.
	filetype plugin indent on
	" Use actual tab chars in Makefiles.
	autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif
