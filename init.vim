" COLORSCHEME
colorscheme deus
let g:airline_theme='deus'

" TODO - Language Server

" CUSTOM MAPPINGS
imap jk <Esc>
imap JK <Esc>
nmap cw ciw
" Open tag in new split
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
" Preferred search order
noremap # *
noremap * # 
" Move out of terminal to panes
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l

" COMMANDS
set showcmd
set wildmenu

" Reading markdown syntax highlight
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufFilePre,BufRead *.mdx set filetype=markdown
" Utilize line numbers if diffing with neovim
if &diff
    set number
endif
" Exit terminal with C-o
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" TABS
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" GRAPHICS
set cursorline
set number
set ruler
set lazyredraw
set splitbelow
set splitright
syntax enable

" SEARCHING
set hlsearch
set incsearch
set ignorecase
set showmatch

" INDEXING
set tags=./tags;,tags;

" FONTS
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set fileencoding=utf-8
set termencoding=utf-8
set encoding=utf-8
scriptencoding utf-8

" PLUGINS
call plug#begin('~/.vim/plugged')
" Convenience, navigation
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'

" Fuzzy searching - HIGHLY suggest BurntSushi/ripgrep
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Aesthetics
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kshenoy/vim-signature'
" Plug 'ryanoasis/vim-devicons'

" PLUGINS - LANGUAGES, LINTING, ETC.
Plug 'dense-analysis/ale'
" Language Server
Plug 'neovim/nvim-lspconfig'

" Language server / tags
" TODO reinstall gutentags
" Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/gem-ctags'

" Ruby, rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'

" Javascript
Plug 'pangloss/vim-javascript'

" GraphQL
Plug 'jparise/vim-graphql'

" Markdown
Plug 'tpope/vim-markdown'

" Misc utility
Plug 'tpope/vim-dispatch'
" Testing
Plug 'vim-test/vim-test'

" TODO
"Plug 'SirVer/ultisnips'
"Plug 'epilande/vim-es2015-snippets'
" Solargraph language server?
call plug#end()

" PLUGIN MODIFICATIONS
" Custom mappings
" Open file in NerdTree - TODO identify if i like this
map <leader>r :NERDTreeFind<cr>
nnoremap <C-n> :NERDTreeToggle<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep hidden=true<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Custom Variables
" Nerdtree hidden
let NERDTreeShowHidden=1

" Airline views
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Startup window
let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'}, '~/.zshrc' ]

function! GetUniqueSessionName()
  let path = fnamemodify(getcwd(), ':~:t')
  let path = empty(path) ? 'no-project' : path
  let branch = gitbranch#name()
  let branch = empty(branch) ? '' : '-' . branch
  return substitute(path . branch, '/', '-', 'g')
endfunction

" Leaving a project along a git branch will save that session name
" autocmd VimLeavePre * silent execute 'SSave! ' . GetUniqueSessionName()

" Ruby development - ALE
let g:ale_linters = {
      \ 'typescriptreact': ['prettier'],
      \ 'javascriptreact': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'javascript': ['prettier'],
      \ 'ruby': ['standardrb']
      \ }
let g:ale_fixers = {
      \ 'typescriptreact': ['prettier'],
      \ 'javascriptreact': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'javascript': ['prettier'],
      \ 'css': ['prettier'],
      \ 'ruby': ['standardrb']
      \  }
let g:ale_fix_on_save = 1
" Ruby development - Fixes standardrb conflict w/ vim-ruby
let g:ruby_indent_assignment_style = 'variable'

" Testing with vim-test and vim-dispatch
" let test#strategy = "dispatch"
