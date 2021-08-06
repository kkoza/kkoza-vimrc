" Dependencies
"
" FZF - brew install fzf
" $(brew --prefix)/opt/fzf/install
"
" Silver searcher - brew install the_silver_searcher for Ag command
" Monokai color scheme optional

" Plugins
call plug#begin('~/.vim/plugged')
" Vanity
Plug 'kshenoy/vim-signature'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" Utility
Plug 'w0rp/ale'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


" Misc
Plug 'tpope/vim-surround' " cs'[ -> [tpope/vim-surround]

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-obsession' " :Obsess [sessionFile]
Plug 'mileszs/ack.vim' " Ag/Ack (silver searcher)
Plug 'wesQ3/vim-windowswap'

" Language
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'vim-scripts/CSApprox'
" post install (yarn install | npm install) then load plugin only for editing supported files
" Linting
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'SirVer/ultisnips'
Plug 'epilande/vim-es2015-snippets'
Plug 'neovim/nvim-lspconfig'
call plug#end()


" Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

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
    highlight TabLineFill     cterm=none ctermfg=59  ctermbg=60 
    highlight TabLine         cterm=none ctermfg=30 ctermbg=31
    highlight TabLineSel      cterm=none ctermfg=30 ctermbg=31
    highlight Comment         ctermfg=244
    highlight LineNr          ctermfg=59
    highlight jsThis          ctermfg=209
    highlight javaScriptGloba ctermfg=57
    highlight ALEErrorSign    ctermfg=90
    highlight ALEError        ctermbg=90
    highlight Todo cterm=bold ctermfg=120 gui=bold ctermbg=239,reverse guifg=#87ff87
    highlight kkozaHighlight ctermfg=120 cterm=bold
    match kkozaHighlight /kkoza/
endfunction


augroup kkoza
    autocmd!
    autocmd ColorScheme * call Highlighter()
augroup END
colorscheme panic
syntax on
syntax enable

" Custom mappings
imap jk <Esc>
imap JK <Esc>
nmap cw ciw
inoremap <s-Tab> <C-d>
  " Preferred search order
noremap # *
noremap * # 
  " Remap leader
let mapleader = "\<Space>"

" Tools
if &diff
    set number
endif

" Commands
set showcmd
set wildmenu

" Fonts
set encoding=UTF-8


" PLUGINS
" scrooloose/nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1


" fzf
map ; :FZF<CR>

noremap , ;
" Silver searcher (Ack.vim)

" let g:ackprg = 'ag --nogroup --nocolor --column'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
  " lightline
  " Set colors, show relative file path
    " 'gitbranch#name' per itchyny/vim-gitbranch
let g:lightline = {
      \ 'colorscheme': 'panic',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightLineFilename',
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
function! LightLineFilename()
  return expand('%')
endfunction

set noshowmode

" UtilSnips
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
" If you want :UltiSnipsEdit to split your window. ??? TODO kkoza
let g:UltiSnipsEditSplit="vertical"

" deoplete
let g:deoplete#enable_at_startup = 1


