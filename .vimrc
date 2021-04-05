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
noremap Q <Nop>

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
let g:ctrlp_custom_ignore = 'node_modules\|.git\|__pycache__'

" git fugitive settings
"git  git://github.com/tpope/vim-fugitive.git

" NerdTree settings
"git https://github.com/scrooloose/nerdtree.git

" Whitespace highlight
"git https://github.com/ntpeters/vim-better-whitespace

" surround word or line with symbols:
" ysiw' - surround word
"git https://github.com/tpope/vim-surround
"git https://github.com/tpope/vim-repeat

" Comments in vim, gc and gcc command
autocmd FileType python setlocal commentstring=#\ %s
autocmd BufRead,BufNewFile .vimrc setlocal commentstring=\"\ %s
"git https://github.com/tpope/vim-commentary

" Cool interface
"git https://github.com/vim-airline/vim-airline

" Tabularize, example: ":Tab \:"
"git https://github.com/godlygeek/tabular

"git https://github.com/Chiel92/vim-autoformat.git
noremap <F4> :Autoformat<CR>
"git https://github.com/yggdroot/indentline
" let g:indentLine_enabled = 0

"git https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack.vim
vnoremap <C-A> y:Ack "<C-r>=escape(fnameescape(@"), '()')<cr>"<cr>
noremap <F3> :Ack <cword><cr>

"git https://github.com/honza/vim-snippets
"git https://github.com/garbas/vim-snipmate
"git https://github.com/MarcWeber/vim-addon-mw-utils.git
"git https://github.com/tomtom/tlib_vim.git
let g:snipMate = { 'snippet_version' : 1 }

"git https://github.com/mg979/vim-visual-multi.git
let g:VM_maps = {}
let g:VM_maps["Select Cursor Down"] = '<C-j>'
let g:VM_maps["Select Cursor Up"]   = '<C-k>'
