set encoding=utf-8
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
inoremap jk <ESC>
nnoremap Q @
nnoremap <leader>w :w<CR>

let g:EasyMotion_do_mapping = 0
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

nmap s <Plug>(easymotion-overwin-f)
nmap <Space> <Plug>(easymotion-overwin-f2)

if has('patch-8.0.1206')
  " In patch 8.0.1206 the event CmdlineEnter and CmdlineLeave was added
  augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter [/\?] :set hlsearch
    autocmd CmdlineLeave [/\?] :set nohlsearch
  augroup END
endif

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

:command! Isort execute ':w' | execute ':silent !pipenv run isort -rc %' | execute ':edit!' | execute ':redraw!'

let g:ackprg = 'ag --vimgrep'

set wildignore+=*/node_modules/*,*/__pycache__/*,*.pyc,*/static_root/*,*/bower_components/*
