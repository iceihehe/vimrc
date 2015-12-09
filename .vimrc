set nocompatible    " 关闭Vi兼容模式
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'L9'
Plugin 'Shougo/neocomplete'
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
let g:rehash256 = 1 " 配色高亮

" colorscheme inkpot
colorscheme Tomorrow-Night
"
" vim-airline
"
let g:airline#extensions#tabline#enabled = 1
"
" neocomplete
"
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
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
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0   

" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "#!/usr/bin/env python")
        call append(1, "# -*- coding: utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc

