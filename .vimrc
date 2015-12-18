set nocompatible    " 关闭Vi兼容模式
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'scrooloose/syntastic'
call vundle#end()
filetype plugin indent on
"
"
if has("syntax")
    syntax on
endif
"
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set list
scriptencoding utf-8
set encoding=utf-8
set listchars=tab:▸\

set number      " 显示行号
set cursorline  " 突出显示当前行
set cursorcolumn    " 高亮光标列
set hlsearch    " 高亮显示搜索结果
set incsearch   " 同步搜索
set nobackup    " 不生成备份文件
set noswapfile  " 不生成交换文件
set encoding=utf-8
set t_Co=256
set laststatus=2    " 开启状态栏信息
set completeopt-=preview    " 去掉preview窗口
let g:rehash256 = 1 " 配色高亮

" colorscheme
colorscheme Tomorrow-Night
"
" vim-airline
"
let g:airline#extensions#tabline#enabled = 1
"
" ctrlp
"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"
"syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0   

" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为python
    if &filetype == 'python'
        "call setline(1, "#!/usr/bin/env python")
        "call append(1, "# -*- coding: utf-8 -*-")
        call setline(1, "# -*- coding: utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc

