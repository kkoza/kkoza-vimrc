" Dependencies
"
" FZF - brew install fzf
" $(brew --prefix)/opt/fzf/install
"
" Silver searcher - brew install the_silver_searcher for Ag command
" Monokai color scheme optional

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jparise/vim-graphql'
Plug 'mileszs/ack.vim' " Ag/Ack (silver searcher)
call plug#end()


" Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
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

" Custom highlights
filetype indent on
filetype plugin indent on

function! Highlighter() abort
    highlight TabLineFill cterm=none ctermfg=59  ctermbg=60 
    highlight TabLine     cterm=none ctermfg=30 ctermbg=31
    highlight TabLineSel  cterm=none ctermfg=30 ctermbg=31
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
colorscheme monokai
"colorscheme slate

" Custom mappings
imap jk <Esc>
imap JK <Esc>
nmap cw ciw
inoremap <s-Tab> <C-d>
autocmd vimenter * NERDTree " scrooloose/nerdtree
map <C-n> :NERDTreeToggle<CR>

" fzf
map ; :GFiles<CR>
noremap , ;
" Silver searcher (Ack.vim)
let g:ackprg = 'ag --nogroup --nocolor --column'
" lightline
" Set colors, show relative file path
let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }
function! LightLineFilename()
  return expand('%')
endfunction
set noshowmode

" Tools
if &diff
    set number
endif

