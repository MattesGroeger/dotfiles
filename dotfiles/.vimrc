" Turn off vi compatibility
set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundle manager
Bundle 'gmarik/vundle'

" Plugins
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'
Bundle 'kien/ctrlp.vim'
Bundle 'wesQ3/vim-windowswap'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'mileszs/ack.vim'
Bundle 'godlygeek/tabular'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'regedarek/ZoomWin'
Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
Bundle 'bitc/vim-hdevtools'

" Language Support
Bundle 'vim-ruby/vim-ruby'
Bundle 'plasticboy/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'bitc/vim-hdevtools'

" Support & Utils
Bundle 'xolox/vim-misc'
Bundle 'tpope/vim-repeat'
Bundle 'nathanaelkane/vim-indent-guides'

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
set showcmd                       " Show incomplete cmds down the bottom
set showmode                      " Show current mode down the bottom

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
set completeopt=longest,menu
highlight Pmenu ctermfg=25 ctermbg=195
highlight PmenuSel ctermfg=195 ctermbg=25

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
nmap <C-L> :vertical resize -5<CR>
nmap <C-K> :resize +5<CR>
nmap <C-J> :resize -5<CR>
nmap <C-H> :vertical resize +5<CR>

" F-Keys
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :NERDTreeFind<CR>
nmap <F4> :set hlsearch!<CR>
nmap <F5> :TagbarToggle<CR>

" Open new windows at bottom/right
set splitbelow
set splitright

" Load indent file for the current filetype
filetype indent on

" Markdown initial fold off
let g:vim_markdown_initial_foldlevel=99

" Custom file type handling
autocmd Filetype erlang setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 colorcolumn=80
autocmd Filetype cs setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*/ebin/*,*.beam

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabMappingTabLiteral = "<c-v>"
let g:SuperTabLongestEnhanced = 1

" TagBar
let g:tagbar_width = 30
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_indent = 1
let g:tagbar_foldlevel = 2

" NERD tree
let NERDTreeIgnore = ['\.meta$']
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1

" BufExplorer
let g:bufExplorerShowRelativePath = 1
let g:bufExplorerDefaultHelp = 0

" Ack
set grepprg=ack\ -k
nmap gs :silent! :grep <C-R><C-W> .<CR>:copen<CR>:redra!<CR>
nmap gn :silent! :keepjumps :cnext<CR>
nmap gp :silent! :keepjumps :cprevious<CR>

" Syntastic
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

" Vim Intend Guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8
