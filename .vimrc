"syntax on
set cursorcolumn 
set cursorline 
set number
set hlsearch
set incsearch

set tabstop=3
set softtabstop=3
set shiftwidth=3
set expandtab
set smartindent
set autoindent

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/nerdtree

set wildignore+=*/dist/*    " MacOSX/Linux
set wildignore+=*.o    " MacOSX/Linux
