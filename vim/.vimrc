call plug#begin()

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-flagship'
Plug 'tpope/vim-vinegar'
Plug 'sjl/gundo.vim'
if v:version > 702
   Plug 'Shougo/unite.vim'
endif

call plug#end()

let mapleader=','

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set laststatus=2
set showtabline=2
set guioptions-=e

set t_co=256
if v:version > 702
   set relativenumber
else
   set number
endif
set background=dark
colorscheme solarized

" Autohide buffers when they are modified
set hidden

" Remap Esc
inoremap kj <Esc>

" Remap windows navigation
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" External command with !
nnoremap ! :!

noremap <Leader>z <C-Z>
noremap <Leader><Leader>e :vsplit ~/.vimrc<CR>
noremap <Leader><Leader>v :source ~/.vimrc<CR>

autocmd InsertLeave,TextChanged * :silent update
