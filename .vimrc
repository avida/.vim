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

call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/vim-easy-align'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
" color schemas
Plug 'morhetz/gruvbox'  " colorscheme gruvbox
Plug 'mhartington/oceanic-next'  " colorscheme OceanicNext
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'ayu-theme/ayu-vim'

Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'

" Whitespace highlight
Plug 'ntpeters/vim-better-whitespace'
" surround word or line with symbols:
" ysiw' - surround word
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'mattn/webapi-vim'
Plug 'tpope/vim-commentary'
" Cool interface
Plug 'vim-airline/vim-airline'
" Tabularize, example: ":Tab \:"
Plug 'godlygeek/tabular'

Plug 'Chiel92/vim-autoformat'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'yggdroot/indentline'

Plug 'mileszs/ack.vim'
Plug 'mg979/vim-visual-multi'
Plug 'szw/vim-g'
call plug#end()

set wildignore+=*/dist/*    " MacOSX/Linux
set wildignore+=*.o    " MacOSX/Linux
set noswapfile

" Tagbar settings
nmap <C-T> :TagbarToggle<CR>

" Controlp settings
let g:ctrlp_custom_ignore = 'node_modules\|.git\|__pycache__'
set wildignore+=cdk.out

" git fugitive settings
let g:github_user = 'avida'

" NerdTree settings
noremap <C-B> :NERDTreeToggle<CR>


" Comments in vim, gc and gcc command
autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType sh setlocal commentstring=#\ %s
autocmd FileType bash setlocal commentstring=#\ %s
autocmd FileType tf setlocal commentstring=#\ %s
autocmd BufRead,BufNewFile .vimrc setlocal commentstring=\"\ %s



noremap <F4> :Autoformat<CR>
let g:formatters_python = ['black']

let g:indentLine_enabled = 0


vnoremap <C-A> y:Ack "<C-r>=escape(fnameescape(@"), '()')<cr>"<cr>
noremap <F3> :Ack <cword><cr>

let g:snipMate = { 'snippet_version' : 1 }

let g:VM_maps = {}
let g:VM_maps["Select Cursor Down"] = '<C-j>'
let g:VM_maps["Select Cursor Up"]   = '<C-k>'

