syntax on

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
  filetype indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
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

" For gvim
if has('gui_running')
	colorscheme torte
	set guioptions=	" Disable all GUI elements

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
endif

" Use tabs for buffers
set switchbuf=usetab,newtab

" Always display the cursor's line and column number
set ruler

" Highlight all search matches
set hlsearch

" When rewrapping text, don't use double spaces after periods
set nojoinspaces
