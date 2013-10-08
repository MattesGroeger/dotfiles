set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-ruby/vim-ruby'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-colorscheme-switcher'
Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-surround'

filetype on
filetype plugin indent on

" Turn off vi compatibility
set nocompatible

" Basic editor settings
set t_Co=256
:syntax on
:set number
:colorscheme desert

" Formatting options
set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

" Default indent settings
set smartindent
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default
set wrap        "dont wrap lines
set linebreak   "wrap lines at convenient points

" Resize current buffer by +/- 5 
nnoremap <C-L> :vertical resize -5<CR>
nnoremap <C-K> :resize +5<CR>
nnoremap <C-J> :resize -5<CR>
nnoremap <C-H> :vertical resize +5<CR>

" F-Keys
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFind<CR>
nnoremap <F4> :set hlsearch!<CR>

" Move between windows with Ctrl + J,K,L,H
" noremap <M-J> <C-W><C-J>
" noremap <M-K> <C-W><C-K>
" noremap <M-L> <C-W><C-L>
" noremap <M-H> <C-W><C-H>

" Search
set grepprg=ack\ -k
nnoremap gs :silent! :grep <C-R><C-W> .<CR>:copen<CR>:redra!<CR>
nnoremap gn :silent! :keepjumps :cnext<CR>
nnoremap gp :silent! :keepjumps :cprevious<CR>

" Open new windows at bottom/right
set splitbelow
set splitright

" Load indent file for the current filetype
filetype indent on

" Markdown initial fold off
let g:vim_markdown_initial_foldlevel=99
