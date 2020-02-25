" Explicitly disable loading of rc files found in the directory of the file
" being edited. Having this enabled would be a security risk.
set noexrc

" Disable modelines, also a security risk
set nomodeline

" Restore the last cursor position when reopening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching

set scrolloff=2
set expandtab
set softtabstop=4
set shiftwidth=4
set smartindent

" Just use normal tabs when not editing code
autocmd BufRead,BufNewFile *.txt setlocal noexpandtab softtabstop=0 shiftwidth=8

" smartindent is annoying when working in python
au! FileType python setl nosmartindent

" When rewrapping text, don't use double spaces after periods
set nojoinspaces

" Highlight characters past columns 80 and 100
set colorcolumn=81,101

" Make command-line and insert-mode completion behave similar to bash. For
" command-line completion, fall back to vim's default behavior if we hit tab a
" second time, and display a menu of completion items.
set wildmode=list:longest,full
set completeopt=menu,longest,preview

" Use 24-bit color when running in a terminal
set termguicolors
colorscheme desert
