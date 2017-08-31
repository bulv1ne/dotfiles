set nocompatible
execute pathogen#infect()
set t_Co=256
let mapleader = ","

hi IndentGuidesOdd ctermbg=234
hi IndentGuidesEven ctermbg=235

filetype plugin on
syntax on
set number
set backspace=2

set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set list listchars=tab:\ \ ,trail:·
vnoremap . :norm.<CR>
set background=dark
"colorscheme base16-google-dark
set scrolloff=3
inoremap jj <ESC>

set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

set ignorecase
set incsearch

set nobackup
set nowritebackup
set noswapfile

set autoread
set nocursorline
"set ruler

:command! Isort execute ':w' | execute ':silent !isort -rc %' | execute ':edit!' | execute ':redraw!'
:command! Flake8 execute ':w' | execute ':silent !flake8 %'

let g:ackprg = 'ag --vimgrep'

set wildignore+=*/node_modules/*,*/__pycache__/*,*.pyc,*/static_root/*,*/bower_components/*
