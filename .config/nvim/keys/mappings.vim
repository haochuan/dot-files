" Better indenting
vnoremap < <gv
vnoremap > >gv

if exists('g:vscode')

  " Simulate same TAB behavior in VSCode
  nmap <Tab> :Tabnext<CR>
  nmap <S-Tab> :Tabprev<CR>

else

  " I hate escape more than anything else
  inoremap jk <Esc>
  inoremap kj <Esc>


  " TAB in general mode will move to next buffer
  " nnoremap <TAB> :tabnext<CR>
  " SHIFT-TAB will go back
  " nnoremap <S-TAB> :tabprevious<CR>
  " Ctrl + x to kill current buffer
  nnoremap <C-x> :bw<CR>


  " Use control-c instead of escape
  nnoremap <C-c> <Esc>
  " <TAB>: completion.
  " inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"


  " Better window navigation
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l


  " Use alt + hjkl to resize windows
  nnoremap <M-j>    :resize -2<CR>
  nnoremap <M-k>    :resize +2<CR>
  nnoremap <M-h>    :vertical resize -2<CR>
  nnoremap <M-l>    :vertical resize +2<CR>

  " copy selection to clipboard
  vmap <C-c> :w !pbcopy<CR><CR>

  " turn off search highlight
  nnoremap ,<space> :nohlsearch<CR>

  "excute files
  autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
  autocmd filetype javascript nnoremap <F4> :w <bar> exec '!node '.shellescape('%')<CR>
  autocmd filetype typescript nnoremap <F4> :w <bar> exec '!ts-node '.shellescape('%')<CR>
  autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('%:r')<CR>
  autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('%:r')<CR>

endif
