set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'vim-ruby/vim-ruby'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-colorscheme-switcher'

filetype on
filetype plugin indent on

" Turn off vi compatibility
set nocompatible

" Basic editor settings
:syntax on
:set number
:colorscheme slate

" Formatting options
set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

" Default indent settings
set smartindent
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Toggle NERDTree
nnoremap <F2> :NERDTreeToggle<cr>

" Display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default
set wrap        "dont wrap lines
set linebreak   "wrap lines at convenient points

" Resize current buffer by +/- 5 
nnoremap <S-L> :vertical resize -5<cr>
nnoremap <S-K> :resize +5<cr>
nnoremap <S-J> :resize -5<cr>
nnoremap <S-H> :vertical resize +5<cr>

" Move between windows with Ctrl + J,K,L,H
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new windows at bottom/right
set splitbelow
set splitright

" Load indent file for the current filetype
filetype indent on
