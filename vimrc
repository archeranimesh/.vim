" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on
filetype indent on      " load filetype-specific indent files"

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

" http://stackoverflow.com/questions/1979520/auto-open-nerdtree-in-every-tab
autocmd BufWinEnter * NERDTreeMirror


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
" Stop Key movement with arrow key
"http://stackoverflow.com/questions/5367760/vim-disabling-the-cursor-arrow-keys-but-only-for-navigation
" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Tab Settings
" http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
set tabstop=4 		" show existing tab with 4 spaces width
set shiftwidth=4 	" when indenting with '>', use 4 spaces width
set expandtab 		" On pressing tab, insert 4 spaces
set softtabstop=4   " Sets the number of columns for a TAB."
set cursorline      " Show visual line under the curson.
" Only do this part when compiled with support for autocommands.
if has("autocmd")
	" Use filetype detection and file-based automatic indenting.
	filetype plugin indent on
	" Use actual tab chars in Makefiles.
	autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
    " Markdown
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
endif

" https://dougblack.io/words/a-good-vimrc.html
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " Ignore case when searching
set number              " show line numbers"
set showcmd             " show command in bottom bar"
set wildmenu            " visual autocomplete for command menu"
set lazyredraw          " redraw only when we need to."
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" https://github.com/easymotion/vim-easymotion
map <Leader> <Plug>(easymotion-prefix)

" No annoying sound on errors
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1
" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


" Ctrl+s to save a File, additonally one more change in bashrc
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" Set color
" https://github.com/jnurmine/Zenburn
set t_Co=256
colors zenburn

" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
let g:ycm_autoclose_preview_window_after_completion=1
" Chose the python executable based on the virtualenv.
let g:ycm_python_binary_path = 'python'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" http://stackoverflow.com/questions/21743323/youcompleteme-freezes-when-used-with-python-mode
let g:pymode = 0    " Disable Pymode
let g:pymode_rope_complete_on_dot = 0
" Tab was not working in snipmate, youcompleteme
"http://stackoverflow.com/questions/15572395/change-the-default-tab-in-snipmate
" Ctrl + j will trigger snipmate.
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
" http://christian.sterzl.info/blog/vim-as-ide-for-python 
" Goto definition with F3
map <F3> :YcmCompleter GoTo<CR>

" https://www.youtube.com/watch?v=YhqsjUUHj6g
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamed
set clipboard=unnamedplus       "This works.
" BackSpace works.
set bs=2
" http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste

" https://vi.stackexchange.com/questions/2674/how-can-i-easily-move-a-line
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


" set ruler for details of the file
set ruler
