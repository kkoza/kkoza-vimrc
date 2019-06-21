" Dependencies
"
" FZF - brew install fzf
" $(brew --prefix)/opt/fzf/install
"
" Silver searcher - brew install the_silver_searcher for Ag command
" Monokai color scheme optional
"
" Ensure that vim has python2 and python3 support: https://github.com/neovim/neovim/issues/2561

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround' " cs'[ -> [tpope/vim-surround]
Plug 'scrooloose/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jparise/vim-graphql'
Plug 'mileszs/ack.vim' " Ag/Ack (silver searcher)
Plug 'tpope/vim-obsession' " :Obsess [sessionFile]
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --tern-completer
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'SirVer/ultisnips'
Plug 'epilande/vim-es2015-snippets'
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
    highlight TabLineFill     cterm=none ctermfg=59  ctermbg=60 
    highlight TabLine         cterm=none ctermfg=30 ctermbg=31
    highlight TabLineSel      cterm=none ctermfg=30 ctermbg=31
    highlight Comment         ctermfg=59
    highlight LineNr          ctermfg=59
    highlight jsThis          ctermfg=209
    highlight javaScriptGloba ctermfg=57
    highlight ALEErrorSign    ctermfg=90
    highlight ALEError        ctermbg=90
    highlight Todo cterm=bold ctermfg=120 gui=bold,reverse guifg=#87ff87
endfunction

augroup kkoza
    autocmd!
    autocmd ColorScheme * call Highlighter()
augroup END
syntax on
syntax enable
colorscheme monokai

" Custom mappings
imap jk <Esc>
imap JK <Esc>
nmap cw ciw
inoremap <s-Tab> <C-d>

" PLUGINS
  " scrooloose/nerdtree
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

  " YCM for JavaScript
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" UtilSnips
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window. ??? TODO kkoza
let g:UltiSnipsEditSplit="vertical"

" Tools
if &diff
    set number
endif

