"set shellcmdflag=-ic
set nocompatible              " be iMproved, required
set wildmenu
autocmd FileType netrw setl bufhidden=delete
set path+=**

filetype off                  " required
let mapleader = ","

set incsearch
set hlsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4
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

"move line up or down
nmap <A-j> mz:m+<CR>`z
nmap <A-k> mz:m-2<CR>`z

"save
imap <C-s> <ESC>:w<CR>i<Right>
map <C-s> :w<CR>

"cool brackets
imap { {}<Left>
imap {} {}
imap ( (<Space><Space>)<Left><Left>
imap () ()
imap [ [<Space><Space>]<Left><Left>
imap [] []
imap {<Enter> {<CR>}<Esc>ko

"appending is always fun on the end of the line
nmap a A

"undo redo
imap <C-z> <Esc>:undo<CR>i<Right>
imap <C-y> <Esc>:redo<CR>i<Right>

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
