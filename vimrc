set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required

set incsearch
set hlsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent
set number
set ruler
set cursorline


syntax on
set noswapfile
	

imap jj <Esc>

"save
imap <C-s> <ESC>:w<CR>i<Right>
map <C-s> :W<CR>

"cool brackets
imap { {}<Left>
imap ( ()<Left>
imap {<Enter> {<CR><CR>}<Left>

"undo redo
imap <C-z> <Esc>:undo<CR>i<Right>
imap <C-y> <Esc>:redo<CR>i<Right>


