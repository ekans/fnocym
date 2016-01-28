call plug#begin()

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/vimshell.vim'
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
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'
Plug 'SirVer/ultisnips'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'scrooloose/syntastic'

call plug#end()

let mapleader=','

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set laststatus=2
set showtabline=2
set guioptions-=e

set t_co=256
set background=dark
colorscheme solarized

set relativenumber

" Autohide buffers when they are modified i.e. do not avoid to move to another
" buffer if the current buffer is modified
set hidden

" Search options
set ignorecase
set smartcase

" Remap Esc
inoremap kj <Esc>

set scrolloff=10
" Remap windows navigation
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l

" External command with !
nnoremap ! :!
" Command line mapping
cnoremap kj <C-C>
cnoremap <C-a> <Home>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d>  <Delete>
cnoremap <M-b> <C-Left>
cnoremap <M-f> <C-Right>

noremap <Leader>z <C-Z>

" vimrc editing stuff
noremap <Leader><Leader>v :vsplit $MYVIMRC<CR>
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Clean file on save
augroup clean_file " {
    " e flag to not issue an error when the search failed
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
    autocmd BufWritePre * :%s/\t/    /ge
augroup END " }

" Unite mapping
let g:unite_source_history_yank_enable = 1
let g:unite_source_history_yank_save_clipboard = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction


" Java settings
augroup java_file
    autocmd!
    autocmd FileType java set omnifunc=javacomplete#Complete
    autocmd FileType java set makeprg=mvn\ compile\ -q
    autocmd FileType java set errorformat=\[ERROR]\ %f:[%l\\,%v]\ %m
augroup END
