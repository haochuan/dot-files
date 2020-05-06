" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Initial plugged
call plug#begin('~/.vim/plugged')

if exists('g:vscode')
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdcommenter'
else
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'frazrepo/vim-rainbow'
  Plug 'jiangmiao/auto-pairs'
  Plug 'scrooloose/nerdcommenter'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'mcchrish/nnn.vim'
  Plug 'heavenshell/vim-jsdoc'
  Plug 'sheerun/vim-polyglot' " for syntax highlight
  Plug 'terryma/vim-multiple-cursors'
  Plug 'junegunn/fzf.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'mattn/emmet-vim'
  " zen writing mode, :Goyo for start and :Goyo! for end
  Plug 'junegunn/goyo.vim'
  " show registers ctrl + r on INSERT / `"` on NORMAL
  Plug 'junegunn/vim-peekaboo'
  Plug 'tpope/vim-repeat'
  Plug 'easymotion/vim-easymotion'
  Plug 'rust-lang/rust.vim'
endif

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
