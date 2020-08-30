set cursorcolumn 
set cursorline 
set number
set relativenumber

syntax on
set hlsearch
set incsearch

set tabstop=3
set softtabstop=3
set shiftwidth=3
set expandtab
set smartindent
set autoindent

autocmd FileType make setlocal noexpandtab
autocmd BufRead,BufNewFile *.py setlocal ts=4 sw=4 sts=4

set runtimepath^=~/.vim/bundle/ctrlp.vim
map m :call cursor(0, virtcol('.') + (virtcol('$') - virtcol('.'))/2)<CR>
map M :call cursor(0, virtcol('.') / 2)<CR>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Pathogen plugin config
"https://github.com/tpope/vim-pathogen.git
execute pathogen#infect()

set wildignore+=*/dist/*    " MacOSX/Linux
set wildignore+=*.o    " MacOSX/Linux

" Tagbar settings
"git https://github.com/majutsushi/tagbar.git
nmap <C-T> :TagbarToggle<CR>

" Controlp settings
"git https://github.com/ctrlpvim/ctrlp.vim.git

" git fugitive settings
"git  git://github.com/tpope/vim-fugitive.git

" NerdTree settings
"git https://github.com/scrooloose/nerdtree.git
