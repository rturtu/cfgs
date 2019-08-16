"Plugins:
"https://github.com/nvie/vim-flake8
"set shellcmdflag=-ic
set nocompatible              " be iMproved, required
set wildmenu
autocmd FileType netrw setl bufhidden=delete
set path+=**

filetype off                  " required
let mapleader = ","

set incsearch
set hlsearch
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set smartindent
set autoindent
set relativenumber number
set ruler

colorscheme desert
set t_Co=256
set cursorline

"highlight  CursorLine ctermbg=White ctermfg=None
autocmd VimEnter * highlight  CursorLine ctermbg=0 cterm=NONE,bold
augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
"autocmd InsertLeave * highlight  CursorLine ctermbg=Yellow ctermfg=None

syntax on

nmap <Space><Space> i<Space><Esc>l

"cool brackets
imap { {}<Left>
imap {} {}
imap ( ()<Left>
imap () ()
imap [ []<Left>
imap [] []
imap {<Enter> {<CR>}<Esc>ko
imap (<Enter> (<CR>)<Esc>ko
imap [<Enter> [<CR>]<Esc>ko

"can't see me, my time is now
:set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

"appending is always fun on the end of the line
nmap a A

"compile
map <Space>c :w<CR>:!comp %<CR>
map <Space>r :w<CR>:!python3 ui.py<CR>

"registers
map sr :reg<CR>

"who needs NERDTree?
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
map <leader>e :Vexplore<CR>
map <leader>d :bd<CR>
map <leader>b :w<CR>:buffer 

" Linters
autocmd BufWritePost *.py call flake8#Flake8()

"f expanded to multiple lines the hard way
nmap f1 /1<CR>
nmap f2 /2<CR>
nmap f3 /3<CR>
nmap f4 /4<CR>
nmap f5 /5<CR>
nmap f6 /6<CR>
nmap f7 /7<CR>
nmap f8 /8<CR>
nmap f9 /9<CR>
nmap f0 /0<CR>
nmap fq /q<CR>
nmap fw /w<CR>
nmap fe /e<CR>
nmap fr /r<CR>
nmap ft /t<CR>
nmap fy /y<CR>
nmap fu /u<CR>
nmap fi /i<CR>
nmap fo /o<CR>
nmap fp /p<CR>
nmap fa /a<CR>
nmap fs /s<CR>
nmap fd /d<CR>
nmap ff /f<CR>
nmap fg /g<CR>
nmap fh /h<CR>
nmap fj /j<CR>
nmap fk /k<CR>
nmap fl /l<CR>
nmap fz /z<CR>
nmap fx /x<CR>
nmap fc /c<CR>
nmap fv /v<CR>
nmap fb /b<CR>
nmap fn /n<CR>
nmap fm /m<CR>
nmap f= /=<CR>
nmap f{ /{<CR>
nmap f} /}<CR>
nmap f( /(<CR>
nmap f) /)<CR>
nmap f' /'<CR>
nmap f[ /[<CR>
nmap f] /]<CR>
nmap f" /"<CR>
nmap <leader>n :nohl<CR>
