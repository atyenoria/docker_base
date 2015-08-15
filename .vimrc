
" http://stevelosh.com/blog/2010/09/coming-home-to-vim
" https://github.com/vim-scripts/vmark.vim--Visual-Bookmarking
" http://nvie.com/posts/how-i-boosted-my-vim/
filetype off
call pathogen#infect()
filetype plugin indent on

set nocompatible

set modelines=0
colo torte
"let g:molokai_original = 1
syntax on
set nu
set mouse=a

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"add
set nonumber


set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline          " Inserts full page width line
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
"set relativenumber     " Vim 7.3 setting
"set undofile
"
"
let mapleader = ","
" jump to the last position when reopening a file
au bufreadpost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Stops back up files being written to present dir
"set backupdir=~/.vim-tmp,~/tmp
set nobackup
set nowritebackup

" Tame searching and moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85         " Vim 7.3 setting

" Force no arrow keys in normal mode
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"nnoremap j gj
"nnoremap k gk

" One less key to hit when you want to enter a cmd
nnoremap ; :

" Save on losing focus - when you tab away form your
" editor all files will be saved
au FocusLost * :wa

" Remapping to esc - giving this ago
inoremap jj <ESC>
nnoremap <leader>w <C-w>v<C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" NERDTree
let NERDTreeIgnore=['\.rbc$', '\~$']
let NERDTreeWinSize=40
let NERDTreeWinPos="Right"
let NERDTreeShowHidden=1
noremap <Leader>r :NERDTreeToggle<CR>
noremap <Leader><TAB> :NERDTreeToggle<CR>

" For sane pasting hit F2 while in insert mode
set pastetoggle=<F2>

" MRU
noremap <Tab> :MRU<CR>
let MRU_Max_Entries = 10

" Enable airline
" Disabling why I understand powerfonts...
"let g:airline_powerline_fonts = 1

" Automatic closing of parenthses
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END
endif
syntax on


set paste