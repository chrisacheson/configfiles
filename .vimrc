" Explicitly disable loading of rc files found in the directory of the file
" being edited. Having this enabled would be a security risk.
set noexrc

" Enable syntax highlighting
syntax on

" Restore the last cursor position when reopening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Load filetype-specific indentation rules
filetype indent on

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes) in terminals

set scrolloff=2
set expandtab
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

" Just use normal tabs when not editing code
autocmd BufRead,BufNewFile *.txt setlocal noexpandtab softtabstop=0 shiftwidth=8

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Get the path './.vim/', relative to this script. Symlinks make this
" complicated.
let s:dotvimdir = fnameescape(fnamemodify(resolve(expand('<sfile>')), ':h').'/.vim/')

" For gvim
if has('gui_running')
    colorscheme desert
    " Don't use bold text
    execute 'source' s:dotvimdir.'highlight_remove_attr.vim'
    call Highlight_remove_attr('bold')

    " Disable all GUI elements
    set guioptions=

    if has ('unix')
        set guifont=ProFont\ 8
        set lines=80
    elseif has('win32')
        set guifont=ProFontWindows:h8:cANSI
        winpos 989 0
        set lines=68
    else
        set lines=40
    endif

    set columns=100
else
    " If we're not in GUI mode, use the desert256 color scheme. This will look
    " best if your terminal is properly configured for 256 colors, but will
    " gracefully degrade otherwise.
    execute 'source' s:dotvimdir.'desert256.vim'
endif

" Use tabs for buffers
set switchbuf=usetab,newtab

" Always display the cursor's line and column number
set ruler

" Highlight all search matches
set hlsearch

" When rewrapping text, don't use double spaces after periods
set nojoinspaces

" Ignore whitespace in vimdiff
set diffopt+=iwhite

" Highlight characters past column 100
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
autocmd BufWinEnter * match OverLength /\%>100v.\+/

" Allow backspace and delete to remove autoindent, newlines, and characters
" before start of insert
set backspace=indent,eol,start

" Make the file explorer open files in a new tab
let g:netrw_browse_split=3

" Make command-line and insert-mode completion behave similar to bash. For
" command-line completion, fall back to vim's default behavior if we hit tab a
" second time, and display a menu of completion items.
set wildmode=list:longest,full
set wildmenu
set completeopt=menu,longest,preview
