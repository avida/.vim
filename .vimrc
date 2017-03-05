syntax on
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

" Pathogen plugin config
" https://github.com/tpope/vim-pathogen.git
execute pathogen#infect()

set wildignore+=*/dist/*    " MacOSX/Linux
set wildignore+=*.o    " MacOSX/Linux

autocmd FileType make setlocal noexpandtab
autocmd BufRead,BufNewFile *.py setlocal ts=4 sw=4 sts=4

" Tagbar settings
" https://github.com/majutsushi/tagbar.git
nmap <C-T> :TagbarToggle<CR>

" Controlp settings
" https://github.com/ctrlpvim/ctrlp.vim.git

" git fugitive settings
" git://github.com/tpope/vim-fugitive.git

" NerdTree settings
" https://github.com/scrooloose/nerdtree.git
