# vimrc
my .vimrc

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim #先安装vundle

git clone https://github.com/iceihehe/vimrc #down项目

cp vimrc/.vimrc ~  #把.vimrc复制到user目录

rm -rvf vimrc #删掉git项目

部分依赖参照https://github.com/Shougo/neocomplete.vim#requirements

进入vim  :PluginInstall

YouCompleteMe需要编译安装, 可以进入~/.vimrc/bundle/YouCompleteMe目录用./install.py --help查看细节

完成

