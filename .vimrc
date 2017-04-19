set cursorcolumn 
set cursorline 
set number
syntax on
set hlsearch
set incsearch

set tabstop=3
set softtabstop=3
set shiftwidth=3
set expandtab
set smartindent

autocmd FileType make setlocal noexpandtab
autocmd BufRead,BufNewFile *.py setlocal ts=4 sw=4 sts=4

set runtimepath^=~/.vim/bundle/ctrlp.vim
map m :call cursor(0, virtcol('$')/2)<CR>
