set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'Valloric/ListToggle'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on
"
"
if has("syntax")
    syntax on
endif
"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set list
set listchars=tab:▸\
"
" syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"
" vim-airline
"
set encoding=utf-8
set t_Co=256
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='jellybeans'
