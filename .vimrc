set nocompatible              " be iMproved, required
filetype off                  " required
" enable paste from system clipboard

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
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'derekwyatt/vim-scala'

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
map <C-e> :NERDTreeTabsToggle<CR>
" Nerdtree Tab
" let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_autofind=1

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"Neo format
"autocmd BufWritePre *.js Neoformat
augroup fmt
  autocmd!
  autocmd BufWritePre *.js Neoformat
  autocmd BufWritePre *.css Neoformat
  autocmd BufWritePre *.json Neoformat
augroup END
let g:neoformat_javascript_prettier = {
      \ 'exe': 'prettier',
        \ 'args': ['--stdin', '--single-quote'],
        \ 'stdin': 1}

let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_json = ['jsbeautify']

" let g:neoformat_enabled_html = ['htmlbeautify']
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
autocmd FileType scala nnoremap <buffer> <F4> :exec '!clear; scala' shellescape(@%, 1)<cr>
autocmd FileType python nnoremap <buffer> <F4> :exec '!clear; python' shellescape(@%, 1)<cr>

" Plugins
" vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files"
" emmet
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}
" jsDoc
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_additional_descriptions=1
let g:jsdoc_enable_es6=1
