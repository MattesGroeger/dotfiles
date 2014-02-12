" Turn off vi compatibility
set nocompatible

filetype off

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
Bundle 'tomtom/tcomment_vim'
Bundle 'kien/ctrlp.vim'
Bundle 'wesQ3/vim-windowswap'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-repeat'
Bundle 'mileszs/ack.vim'
Bundle 'skwp/greplace.vim'
Bundle 'godlygeek/tabular'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'regedarek/ZoomWin'

filetype plugin indent on

" Basic editor settings
set t_Co=256
syntax on
colorscheme desert
set number                        " Show line numbers
set ruler                         " Show cursor position.
set backspace=indent,eol,start    " Allow deleting characters with backspace
set ignorecase                    " Allow case-insensitive searching
set smartcase                     " But case-sensitive if expression contains a capital letter
set autoread                      " automatically re-read changed files
set laststatus=2                  " Show the status line all the time
set history=1000

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}\ %{SyntasticStatuslineFlag()}%=%-16(\ %l,%c-%v\ %)%P

" Current line highlight
set cursorline                    " Enable highlight of current line
hi CursorLine guisp=NONE gui=NONE guifg=NONE guibg=darkgrey ctermfg=NONE ctermbg=black term=NONE cterm=NONE

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " no swap files

" Formatting options
set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

" Spell checker
highlight SpellBad cterm=underline,bold
set spellsuggest=8

" Default indent settings
set smartindent
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set clipboard=unnamed

" Auto completion settings
set completeopt=longest,menuone
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Display tabs and trailing spaces
set list
set listchars=tab:»·,nbsp:•,extends:»,precedes:«,trail:⋅
set incsearch   "find the next match as we type the search
set hlsearch    "highlight searches by default
set wrap        "don't wrap lines
set linebreak   "wrap lines at convenient points

" Command line auto completion
set wildmenu
set wildmode=longest:full,full

" remove trailing whitespace on save
" function! TrimSpaces()
"   if !&binary && &filetype != 'diff'
"     %s/\(^---\?\)\@<!\s*$//ge
"     ''
"   end
" endfunction
" autocmd FileWritePre * :silent! call TrimSpaces()
" autocmd FileAppendPre * :silent! call TrimSpaces()
" autocmd FilterWritePre * :silent! call TrimSpaces()
" autocmd BufWritePre * :silent! call TrimSpaces()

" Highlight status bar when in insert mode
au InsertEnter * hi StatusLine ctermfg=darkred
au InsertLeave * hi StatusLine ctermfg=white
hi StatusLine ctermfg=white
set fillchars+=vert:\ 

" Force syntax highlighting on weird file extensions
au BufReadPost *.sgte set syntax=html

" Configure git diff column (beside line numbers)
highlight clear SignColumn

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

" Nerdtree
let NERDTreeIgnore = ['\.meta$']

" Custom file type handlin
autocmd Filetype erlang setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype cs setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

" BufExplorer config
let g:bufExplorerShowRelativePath=1
