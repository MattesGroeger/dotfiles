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
Bundle 'jlanzarotta/bufexplorer'
Bundle 'regedarek/ZoomWin'
Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
Bundle 'MattesGroeger/vim-bookmarks'

" Language Support
Bundle 'vim-ruby/vim-ruby'
Bundle 'plasticboy/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'bitc/vim-hdevtools'
Bundle 'kana/vim-vspec'

" Support & Utils
Bundle 'MattesGroeger/vim-bookmarks'
Bundle 'xolox/vim-misc'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'guns/xterm-color-table.vim'
Bundle 'Rykka/colorv.vim'
Bundle 'mattn/webapi-vim'

" Colors
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on

" Basic editor settings
syntax on
set number                        " Show line numbers
set ruler                         " Show cursor position.
set backspace=indent,eol,start    " Allow deleting characters with backspace
set ignorecase                    " Allow case-insensitive searching
set smartcase                     " But case-sensitive if expression contains a capital letter
set autoread                      " automatically re-read changed files
set laststatus=2                  " Show the status line all the time
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " No swap files
set showcmd                       " Show incomplete cmds down the bottom
set showmode                      " Show current mode down the bottom
set splitbelow                    " Split underneeth
set splitright                    " Split right
set history=1000
set clipboard=unnamed

" Default indent settings
set smartindent
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Display tabs and trailing spaces
set list
set listchars=tab:→\ ,nbsp:•,extends:»,precedes:«,trail:⋅
set incsearch                     "find the next match as we type the search
set hlsearch                      "highlight searches by default
set wrap                          "don't wrap lines
set linebreak                     "wrap lines at convenient points

" Load indent file for the current filetype
filetype indent on

augroup filetypes
  autocmd!

  " Custom file type handling
  autocmd Filetype erlang setlocal expandtab   tabstop=4 shiftwidth=4 softtabstop=4 colorcolumn=80
  autocmd Filetype cs     setlocal expandtab   tabstop=4 shiftwidth=4 softtabstop=4 nowrap nosmartindent
  autocmd Filetype objc   setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 nowrap
  autocmd Filetype objcpp setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 nowrap

  " Force syntax highlighting on weird file extensions
  autocmd BufReadPost *.sgte set syntax=html

augroup END

" Colors
set t_Co=256
set background=light
colorscheme solarized
highlight Search     cterm=NONE ctermfg=NONE ctermbg=227
highlight MatchParen cterm=NONE ctermfg=255  ctermbg=199
highlight SignColumn ctermbg=15
highlight SpecialKey ctermfg=250 ctermbg=NONE cterm=NONE
highlight NonText    ctermfg=250 ctermbg=NONE

" Statusline contents
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}\ %{SyntasticStatuslineFlag()}%=%-16(\ %l,%c-%v\ %)%P

" Highlight status bar when in insert mode
augroup statusbar_highlight
  autocmd!
  autocmd InsertEnter * highlight StatusLine ctermfg=red
  autocmd InsertLeave * highlight StatusLine ctermfg=0
augroup END
highlight StatusLine ctermfg=0
set fillchars+=vert:\ 

" Command line auto completion
set wildmenu
set wildmode=longest:full,full

" Current line highlight
set cursorline                    " Enable highlight of current line
highlight CursorLine guisp=NONE gui=NONE guifg=NONE guibg=lightgrey ctermfg=NONE ctermbg=lightgrey term=NONE cterm=NONE

" Spell checker
highlight SpellBad cterm=underline,bold
set spellsuggest=8

" Auto completion settings
set completeopt=longest,menu

" remove trailing whitespace on save
function! TrimSpaces()
  if !&binary && &filetype != 'diff' && &filetype != 'vim'
    %s/\(^---\?\)\@<!\s*$//ge
    ''
  end
endfunction
augroup remove_spaces
  autocmd!
  autocmd FileWritePre * :silent! call TrimSpaces()
  autocmd FileAppendPre * :silent! call TrimSpaces()
  autocmd FilterWritePre * :silent! call TrimSpaces()
  autocmd BufWritePre * :silent! call TrimSpaces()
augroup END

" Resize current buffer by +/- 5
nnoremap <C-L> :vertical resize -5<CR>
nnoremap <C-K> :resize +5<CR>
nnoremap <C-J> :resize -5<CR>
nnoremap <C-H> :vertical resize +5<CR>

" F-Keys
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFind<CR>
nnoremap <F4> :nohlsearch<CR>
nnoremap <F5> :TagbarToggle<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Markdown
let g:vim_markdown_initial_foldlevel=99

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*/ebin/*,*.beam,*/.eunit/*

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SupertabContextDefaultCompletionType = "<c-n>"
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

" Syntastic
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

" Vim Intend Guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_color_change_percent = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar']
let g:indent_guides_guide_size = 1
augroup intendation_colors
  autocmd!
  autocmd VimEnter,Colorscheme * :highlight IndentGuidesOdd  ctermbg=7
  autocmd VimEnter,Colorscheme * :highlight IndentGuidesEven ctermbg=7
augroup END
