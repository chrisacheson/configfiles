" Explicitly disable loading of rc files found in the directory of the file
" being edited. Having this enabled would be a security risk.
set noexrc

" Disable modelines, also a security risk
set nomodeline


" Vundle stuff
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Syntastic'
Plugin 'scrooloose/nerdtree'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Syntastic config
let g:syntastic_always_populate_loc_list=1
let g:syntastic_python_checkers=['flake8']

" Enable syntax highlighting
syntax on

" Restore the last cursor position when reopening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

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

" Treat arduino files as C++
autocmd BufRead,BufNewFile *.ino set filetype=cpp

" smartindent is annoying when working in python
au! FileType python setl nosmartindent

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
        set columns=197
        set lines=75
        " Open NERDTree on startup
        autocmd vimenter * NERDTree
    elseif has('win32')
        set guifont=ProFontWindows:h8:cANSI
        winpos 989 0
        set columns=100
        set lines=68

        if v:servername ==? 'VIMSTUDIO'
            execute 'source' s:dotvimdir.'visualstudioinvoke.vim'
        endif

        " Macro to fill in timesheet calculations
        let @a='0w"1yt	j0w"2yt	k0wf	a=2-1j'
    else
        set columns=100
        set lines=40
    endif
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

" Highlight characters past columns 80 and 100
set colorcolumn=81,101

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
