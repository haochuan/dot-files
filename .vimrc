set nocompatible              " be iMproved, required
filetype off                  " required

" Initial plugged
call plug#begin('~/.vim/plugged')


" The following are examples of different formats supported.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdcommenter'
" Languages syntax highlight
Plug 'sheerun/vim-polyglot'
" Typescript
Plug 'Quramy/tsuquyomi'
Plug 'mattn/emmet-vim'
" Use release branch
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'Valloric/YouCompleteMe'

Plug 'jiangmiao/auto-pairs'
Plug 'heavenshell/vim-jsdoc'
Plug 'terryma/vim-multiple-cursors'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
" prettier and eslint
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
" Plug 'prettier/vim-prettier'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat'

"color
" Plug 'dracula/vim', { 'as': 'dracula' }

" Initialize plugin system
call plug#end()

set rtp+=/usr/local/opt/fzf

filetype plugin indent on    " required

" UI
syntax enable
set t_Co=256
colorscheme OceanicNext

" color dracula

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
" ignore certain files
let NERDTreeIgnore=['\.DS_Store$']
"
"excute files
autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype javascript nnoremap <F4> :w <bar> exec '!node '.shellescape('%')<CR>
autocmd filetype typescript nnoremap <F4> :w <bar> exec '!ts-node '.shellescape('%')<CR>
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('%:r')<CR>

" auto load vimrc when there is a change
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" ======================= Plugins Config ============================
"
"
"
" STARTING FOR COC
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup 

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" END FOR COC
" Search for ctags
nnoremap <leader>. :CtrlPTag<cr>

" coc-color-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')


" coc-yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" ctag
" map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>



" jsdoc syntax
let g:javascript_plugin_jsdoc = 1


" Youcompleteme fix
" let g:ycm_global_ycm_extra_conf ='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_filepath_completion_use_working_dir = 1
" let g:ycm_cache_omnifunc=0

" vim-jsx
" let g:jsx_ext_required = 0 " Allow JSX in normal JS files"
" emmet
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  }
\}


let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_additional_descriptions=1
let g:jsdoc_enable_es6=1


" ale
" Enable ESLint only for JavaScript.
let b:ale_linters = ['eslint']
let g:ale_javascript_eslint_options='-c ~/.eslintrc.json'
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
" keymap for next/previous eslint error, l means linter
nmap <silent> [l <Plug>(ale_previous_wrap)
nmap <silent> ]l <Plug>(ale_next_wrap)

" Enable ale auto fix using prettier
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'jsx': ['prettier'],
\   'json': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'markdown': ['prettier'],
\   'scss': ['prettier'],
\   'graphql': ['prettier'],
\   'mdx': ['prettier']
\}
" To have ALE run Prettier on save: 
let g:ale_fix_on_save = 0
" Prettier config
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma none'
" auto fix keymap
nmap <F5> <Plug>(ale_fix)


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
" saerch for files is mapped as ctrl p
nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Rg<Cr>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>w :Windows<CR>
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <leader>t :BTags<CR>
nnoremap <silent> <leader>T :Tags<CR>
nnoremap <silent> <leader>h :History<CR>
" nnoremap <silent> <leader>ag :Ag

nnoremap <silent> <leader>gc :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>

" FZF.vim now supports this command out of the box
" so this code is no longer needed.
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)


" add this at the end of all key mapping function to repeat.vim
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

