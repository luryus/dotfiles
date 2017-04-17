" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","
let maplocalleader="\ "

" === vvv VUNDLE CONFIG vvv ===
set nocompatible              " be iMproved, required
filetype off                  " required

" bootstrap Vundle if not available
if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
    !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" file tree browser
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" html5 syntax plugin
Plugin 'othree/html5.vim'
" text surrounding plugin
Plugin 'tpope/vim-surround'
" js syntax plugin
Plugin 'jelera/vim-javascript-syntax'
" js indentation plugin
Plugin 'pangloss/vim-javascript'
" show indentation markers
Plugin 'nathanaelkane/vim-indent-guides'
" automatic closing bracket insertion
Plugin 'Raimondi/delimitMate'
" TeX support
Plugin 'lervag/vimtex'
" Autocomplete
Plugin 'Valloric/YouCompleteMe'
" Git support
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" Multiple selections
Plugin 'terryma/vim-multiple-cursors'
" powerline
Plugin 'vim-airline/vim-airline'
" syntax checking
Plugin 'vim-syntastic/syntastic'
" editorconfig support
Plugin 'editorconfig/editorconfig-vim'
" tab completion in /search
Plugin 'vim-scripts/SearchComplete'
" fast searching with ctrl-P
Plugin 'ctrlpvim/ctrlp.vim'
" better buffer closing
Plugin 'rbgrouleff/bclose.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" === ^^^ VUNDLE CONFIG ^^^ ===

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set t_Co=256                    "Enable 256-color support
set title


" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on


" set the file explorer mode to the "file tree"
let g:netrw_liststyle=3
" set the file explorer to the mapleader+e keys
map <leader>e :Explore<cr>

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
" Remove trailing whitespace on :w
autocmd BufWritePre * :%s/\s\+$//e

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Custom Settings ========================
" so ~/.yadr/vim/settings.vim

" ================ NERDTree =====================
nnoremap <leader>d :NERDTree<CR>
nnoremap <leader>f :NERDTreeFind<CR>
let NERDTreeIgnore=['^\.DS_Store$', '^node_modules$', '^.git$', '^__pycache__$']
" close vim if only NERDtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
" open nerdtree when opening vim to a dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" ============ Buffers ===========
nnoremap <S-Left> :bprevious<CR>
nnoremap <S-Right> :bnext<CR>
nnoremap <leader>w :Bclose<CR>

" =========== Splits ===========
set splitbelow
set splitright
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :hsplit<CR>
nnoremap <leader>q :close<CR>

" === Airline ===
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
