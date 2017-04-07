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
Plugin 'mxw/vim-jsx'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'sbdchd/neoformat'

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
set lazyredraw          " redraw only when we need to."
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

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
set shiftwidth=2
set expandtab "tag are spaces"

" Key Mapping
" Nerdtree
map <C-e> :NERDTreeToggle<CR>
let g:nerdtree_tabs_autofind=1 "automatically find and select currently opened file in NERDTree

"Neo format
autocmd BufWritePre *.js Neoformat
let g:neoformat_javascript_prettier = {
      \ 'exe': 'prettier',
        \ 'args': ['--stdin', '--single-quote'],
        \ 'stdin': 1}

" Javascript
" jsdoc syntax
let g:javascript_plugin_jsdoc = 1
" Prettier
" autocmd FileType javascript.jsx,javascript setlocal formatprg=prettier\ --stdin\ --single-quote
" format on save
" autocmd BufWritePre *.js :normal gggqG
" restore cursor position
" autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"
" Run js file
autocmd FileType javascript nnoremap <buffer> <F4> :exec '!clear; node' shellescape(@%, 1)<cr>

" Plugins
" vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files"

" jsDoc
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_additional_descriptions=1
let g:jsdoc_enable_es6=1
