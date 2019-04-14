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
set number
set numberwidth=3
set ruler
set lazyredraw
set linebreak

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

" Custom highlights
filetype plugin indent on

" Tools
if &diff
    set number
endif
