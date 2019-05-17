" Plugins
call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()


" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Commands
set showcmd
set wildmenu

" Graphics
set cursorline
if has("autocmd")
    au InsertEnter,InsertLeave * set cul!
endif
set number
set numberwidth=3
set ruler
set lazyredraw
set linebreak
set laststatus=2 " lightline.vim
set splitbelow
set splitright

" Searching
set hlsearch
set incsearch
set ignorecase
set showmatch

filetype indent on

function! Highlighter() abort
    " 58 = violet
    "
    "highlight Comment ctermfg=57
    "highlight LineNr ctermfg=57
    highlight Comment ctermfg=59
    highlight LineNr ctermfg=59
    highlight javaScriptGloba ctermfg=57
    highlight TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
    highlight TabLine ctermfg=Blue ctermbg=Yellow
    highlight TabLineSel ctermfg=Red ctermbg=Yellow
    "highlight identifier ctermfg=187
endfunction

augroup kkoza
    autocmd!
    autocmd ColorScheme * call Highlighter()
augroup END
syntax on
syntax enable
" colorscheme monokai
colorscheme slate

" Custom mappings
imap jk <Esc>
imap JK <Esc>
nmap cw ciw
inoremap <s-Tab> <C-d>
autocmd vimenter * NERDTree " scrooloose/nerdtree
map <C-n> :NERDTreeToggle<CR>

map ; :GFiles<CR>
noremap , ;

" Custom highlights
filetype plugin indent on

" Tools
if &diff
    set number
endif

