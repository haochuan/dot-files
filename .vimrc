set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'heavenshell/vim-jsdoc'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" UI
syntax enable
set t_Co=256
colorscheme OceanicNext

set number
set showcmd "show command in bottom bar
set cursorline "show current line
set showmatch "highlight matching (){}{}

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" set leader key
let mapleader=","       " leader is commao"
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" jk is escape
inoremap jk <esc>
" Tab
set tabstop=2
set softtabstop=2
set expandtab "tag are spaces"

" Key Mapping
" Nerdtree
map <C-e> :NERDTreeToggle<CR>

" Prettier
autocmd FileType javascript set formatprg=prettier\ --stdin\ --single-quote
autocmd BufWritePre *.js :normal gggqG
" Run js file
autocmd FileType javascript nnoremap <buffer> <F4> :exec '!clear; node' shellescape(@%, 1)<cr>
