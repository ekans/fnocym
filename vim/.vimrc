call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'

if v:version > 702
   Plug 'Shougo/unite.vim'
endif

call plug#end()

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" from https://github.com/spf13/spf13-vim/blob/master/.vimrc
if has('statusline')
    set laststatus=2
    " Broken down into easily includeable segments
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%#warningmsg#
    " set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_enable_signs=1
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

let mapleader=','
set t_co=256
if v:version > 702
   set relativenumber
else
   set number
endif
set background=dark
colorscheme solarized

noremap <Leader>z <C-Z>
noremap <Leader><Leader>e :vsplit ~/.vimrc<CR>
noremap <Leader><Leader>v :source ~/.vimrc<CR>

