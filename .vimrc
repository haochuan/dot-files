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
" use tern for javascript with youcompleteme
Plugin 'Valloric/YouCompleteMe'

Plugin 'jiangmiao/auto-pairs'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'mxw/vim-jsx'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'sbdchd/neoformat'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'styled-components/vim-styled-components'
Plugin 'easymotion/vim-easymotion'
Plugin 'prettier/vim-prettier'
Plugin 'posva/vim-vue'
Plugin 'junegunn/fzf.vim'

set rtp+=/usr/local/opt/fzf


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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Search for ctags
nnoremap <leader>. :CtrlPTag<cr>

" ctag
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" ctrlp exclusion
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|project_files$\|test$|\.next$|\.vscode$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

"Neo format

" Then make Neoformat run on save:
autocmd BufWritePre *.js Neoformat

" Then make Neoformat run on save:
" autocmd BufWritePre *.vue Neoformat

autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote\ es5
"" "autocmd FileType vue setlocal formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote\ --trailing-comma\ es6

" Use formatprg when available
let g:neoformat_try_formatprg = 1

" For Vue syntax
" My syntax highlighting stops working randomly
" autocmd FileType vue syntax sync fromstart



" Prettier
" For files other than js
let g:prettier#exec_cmd_path = "/usr/local/bin/prettier"
let g:prettier#autoformat = 0

autocmd BufWritePre *.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md Prettier
" max line length that prettier will wrap on
let g:prettier#config#print_width = 80

" number of spaces per indentation level
let g:prettier#config#tab_width = 2

" use tabs over spaces
let g:prettier#config#use_tabs = 'false'

" print semicolons
let g:prettier#config#semi = 'true'

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

" syntastic
" use ale instead
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']

" ale
" Enable ESLint only for JavaScript.
let b:ale_linters = ['eslint']
let g:ale_javascript_eslint_options='-c ~/.eslintrc.json'


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
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
" nnoremap <silent> <leader>. :AgIn 

nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>

