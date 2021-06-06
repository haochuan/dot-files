"" Tree-Sitter {{
" https://github.com/nvim-treesitter/nvim-treesitter#available-modules

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  indent = {
    enable = true
  },
  highlight = {
    enable = true
  }
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
"" "}}
