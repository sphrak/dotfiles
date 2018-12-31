set nocompatible
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

call plug#begin()
Plug 'drewtempelmeyer/palenight.vim'
Plug 'nvie/vim-flake8'
call plug#end()

set background=dark
set termguicolors
syntax enable
colorscheme palenight
