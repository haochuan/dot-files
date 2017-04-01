" For pathgen.vim
execute pathogen#infect()

" UI
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-oceanicnext
syntax on
filetype plugin indent on

" Key Mapping
" Nerdtree
map <C-e> :NERDTreeToggle<CR>
