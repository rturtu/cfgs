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
set statusline^=%{coc#status()}
"autocomplete closing tag

" persistent undo
set undofile
set undodir=~/.vim/undodir

"
"who searches inside node modules?
set wildignore+=**/node_modules/**

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

inoremap <Esc> <Esc><Esc>


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
map <Space>r :w<CR>:!run %<CR>

"registers
map sr :reg<CR>

let NERDTreeIgnore = ['\.pyc$']
"who needs NERDTree?
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Linters
" autocmd BufWritePost *.py call flake8#Flake8()

"f expanded to multiple lines the hard way
nmap <leader>n :nohl<CR>
map <leader>e :NERDTreeToggle<CR>
" Closing buffers
map <leader>d :BD<CR>
map <leader>D :bd<CR>
map <leader>b :w<CR>:buffer 
" Navigate buffers
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
" Replace global without confirmation
" Replace global with confirmation
map <leader>r :%s//g<Left><Left>
map <leader>R :%s//gc<Left><Left>
map <leader>f :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
map <leader>F :FZF<CR>

" Teleport between buffers at lightning speed


"Plugins
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'qpkorr/vim-bufkill'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'feix760/vim-javascript-gf'

call plug#end()
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-emmet']

"airline config
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols_branch = ''
let g:airline_symbols_readonly = ''
let g:airline_symbols_linenr = ''



:function ReactGF()
:   let w = expand("<cword>")
:   let x = -1
:   let y = 0
:   while x < y
:        x = y
:        y = search(w)
:   endwhile
:   echo y
:endfunction

nmap <leader>q :call ReactGF()<Enter>
nmap <leader>a #$hhhgfn:nohl<CR>

