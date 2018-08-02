sudo apt-get update
sudo apt-get install vim
sudo apt-get install git
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall


sudo apt-get install python-pip
pip install future
git submodule update --init --recursive

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

