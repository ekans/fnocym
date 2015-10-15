call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-fugitive'

if v:version > 702
   Plug 'Shougo/unite.vim'
endif

call plug#end()

let leadder=','
set t_co=256
if v:version > 702
   set relativenumber
else
   set number
endif
colorscheme jellybeans

noremap <Leader>z <C-Z>

