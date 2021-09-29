" Turn off vi compatibility
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Bundle manager
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'regedarek/ZoomWin'
Plugin 'ervandew/supertab'
Plugin 'preservim/tagbar'

" Language Support
Plugin 'vim-ruby/vim-ruby'
Plugin 'plasticboy/vim-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'bitc/vim-hdevtools'
Plugin 'kana/vim-vspec'
Plugin 'Keithbsmiley/swift.vim'
Plugin 'tomlion/vim-solidity'
Plugin 'leafgarland/typescript-vim'
Plugin 'vyperlang/vim-vyper'
Plugin 'MaxMEllon/vim-jsx-pretty'

" Support & Utils
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'xolox/vim-misc'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'guns/xterm-color-table.vim'
Plugin 'Rykka/colorv.vim'
Plugin 'mattn/webapi-vim'
Plugin 'mtth/scratch.vim'

" Colors
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
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
set linebreak                     "wrap lines at convenient points

" Load indent file for the current filetype
filetype indent on

augroup filetypes
  autocmd!

  " Custom file type handling
  autocmd Filetype ruby   setlocal expandtab   tabstop=2 shiftwidth=2 softtabstop=2 colorcolumn=80
  autocmd Filetype erlang setlocal expandtab   tabstop=4 shiftwidth=4 softtabstop=4 colorcolumn=80
  autocmd Filetype cs     setlocal expandtab   tabstop=4 shiftwidth=4 softtabstop=4 nowrap nosmartindent
  autocmd Filetype objc   setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 nowrap
  autocmd Filetype swift  setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 nowrap
  autocmd Filetype objcpp setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 nowrap

  " Force syntax highlighting on weird file extensions
  autocmd BufReadPost *.sgte set syntax=html

augroup END

" Colors
colorscheme solarized
set background=dark
highlight Normal ctermfg=grey ctermbg=black

" Fix sign column backgrounds with solarized dark theme
highlight clear SignColumn

" Statusline contents
set statusline=[%n]\ %<%.99f\ %m\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}\ %=%7(\ %c\ %P\ %)

" Update vim faster (also used for vim-gitgutter signs)
set updatetime=100

" Highlight status bar when in insert mode
augroup statusbar_highlight
  autocmd!
  autocmd InsertEnter * highlight StatusLine ctermfg=red
  autocmd InsertLeave * highlight StatusLine ctermfg=2
augroup END
highlight StatusLine ctermfg=2
set fillchars+=vert:\ 

" Command line auto completion
set wildmenu
set wildmode=longest:full,full

" Current line highlight
set cursorline                    " Enable highlight of current line
highlight CursorLine guisp=NONE gui=NONE guifg=NONE guibg=black ctermfg=NONE ctermbg=black term=NONE cterm=NONE

" Remove underline in Cursor Line Nr
highlight CursorLineNr term=bold cterm=bold ctermfg=255 gui=bold

" Spell checker
highlight SpellBad cterm=underline,bold
set spellsuggest=8

" Auto completion settings
set completeopt=longest,menu

" remove trailing whitespace on save
function! TrimSpaces()
  if !&binary && &filetype != 'diff' && &filetype != 'vim'
    let line = line('.')
    let col = col('.')
    %s/\(^---\?\)\@<!\s*$//ge
    ''
    call cursor(line, col)
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
nnoremap <F6> :set wrap!<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Highlight the column under the cursor
function! EnableHighlightAlign()
echo virtcol('.')
execute "set colorcolumn=+1," . virtcol('.')
endfunction
nnoremap <leader>h :call EnableHighlightAlign()<cr>

" Disable the highlight
function! DisableHighlightAlign()
execute "set colorcolumn=+1"
endfunction
nnoremap <leader>H :call DisableHighlightAlign()<cr>

" Paste yanked/cut word
nnoremap S "_diwP
vnoremap S "_dP

" Markdown
let g:vim_markdown_initial_foldlevel=99

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*/ebin/*,*.beam,*/.eunit/*,.eunit/*

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SupertabContextDefaultCompletionType = "<c-n>"
let g:SuperTabMappingTabLiteral = "<c-v>"
let g:SuperTabLongestEnhanced = 1

" TagBar
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_2/bin/ctags'
let g:tagbar_width = 30
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_indent = 1
let g:tagbar_foldlevel = 2

" NERD tree
let NERDTreeIgnore = ['\.meta$', '\/\.eunit\/*']
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
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar']
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black

" Bookmarks
highlight BookmarkSign ctermbg=NONE ctermfg=4
" nmap <Leader>mm <Plug>ToggleBookmark
" nmap <Leader>mi <Plug>Annotate
" nmap m] <Plug>NextBookmark
" nmap m[ <Plug>PrevBookmark
" nmap <Leader>ma <Plug>ShowAllBookmarks
" nmap <Leader>mc <Plug>ClearBookmarks
" nmap <Leader>mx <Plug>ClearAllBookmarks

let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
function! g:BMWorkDirFileLocation()
    return getcwd(). '/.vim-bookmarks2'
endfunction
