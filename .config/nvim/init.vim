set nocompatible
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

set statusline+=%#warningmsg#                                                        
set statusline+=%{SyntasticStatuslineFlag()}                                         
set statusline+=%*

match ErrorMsg '\%>120v.\+'                                                          
match ErrorMsg '\s\+$'                                                               
autocmd BufWritePre *.py :%s/\s\+$//e

let g:python_recommended_style = 0                                                   
let g:syntastic_always_populate_loc_list = 1                                         
let g:syntastic_auto_loc_list = 1                                                    
let g:syntastic_check_on_open = 1                                                    
let g:syntastic_check_on_wq = 0 

call plug#begin()
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'nvie/vim-flake8'
call plug#end()

set background=dark
set termguicolors
syntax enable
colorscheme palenight
