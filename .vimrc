set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')


" The following are examples of different formats supported.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
" use tern for javascript with youcompleteme
Plug 'Valloric/YouCompleteMe'

Plug 'jiangmiao/auto-pairs'
Plug 'heavenshell/vim-jsdoc'
Plug 'mxw/vim-jsx'
Plug 'terryma/vim-multiple-cursors'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'sbdchd/neoformat'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
" Plug 'prettier/vim-prettier'
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

set rtp+=/usr/local/opt/fzf

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
set diffopt+=vertical

" Disabling swap files
set noswapfile

" Ignore case when searching
set ignorecase

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" set leader key
let mapleader="\<Space>"       " leader is space"
" copy selection to clipboard
vmap <C-c> :w !pbcopy<CR><CR>
" turn off search highlight
nnoremap ,<space> :nohlsearch<CR>

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
" Close NERDTree window when use ctrlp open file
let g:ctrlp_dont_split = 'NERD'
" ctrlp exclusion
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|project_files$\|test$|\.next$|\.vscode$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" Search for ctags
nnoremap <leader>. :CtrlPTag<cr>

" ctag
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>



" jsdoc syntax
let g:javascript_plugin_jsdoc = 1

" Run js file

autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype javascript nnoremap <F4> :w <bar> exec '!node '.shellescape('%')<CR>
autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('%:r')<CR>

" auto load vimrc when there is a change
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

"Youcompleteme fix
let g:ycm_global_ycm_extra_conf ='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

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


" ale
" Enable ESLint only for JavaScript.
let b:ale_linters = ['eslint']
let g:ale_javascript_eslint_options='-c ~/.eslintrc.json'

" Enable ale auto fix
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'markdown': ['prettier'],
\   'scss': ['prettier'],
\   'graphql': ['prettier'],
\   'mdx': ['prettier'],
\}
" To have ALE run Prettier on save: 
let g:ale_fix_on_save = 1
" Prettier config
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'


" nerdcommenter
" for commenting 
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'javascript': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1

" GitGutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
" turn on line highlighting
" let g:gitgutter_highlight_lines = 1


" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


" FZF
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>t :Tags<CR>
nnoremap <silent> <leader>h :History<CR>
" nnoremap <silent> <leader>. :AgIn 

nnoremap <silent> <leader>gc :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>

