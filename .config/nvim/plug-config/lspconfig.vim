" enable languages
lua << EOF 
  require'lspconfig'.rust_analyzer.setup{}
  require'lspconfig'.html.setup{}
  require'lspconfig'.tsserver.setup{}
  require'lspconfig'.bashls.setup{}
  require'lspconfig'.yamlls.setup{}
  require'lspconfig'.vimls.setup{}
  require'lspconfig'.cssls.setup{}
  require'lspconfig'.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
  }
EOF 

" key mapping
nnoremap <silent>gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent>gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent>gi     <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent>rn     <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent>gr     <cmd>lua vim.lsp.buf.reference()<CR>

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" format
nnoremap <silent><F5>    <cmd>lua vim.lsp.buf.formatting()<CR>
autocmd BufWritePre *.js lua vim.lsp.buf.formatting()
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting()
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting()
autocmd BufWritePre *.md lua vim.lsp.buf.formatting()
autocmd BufWritePre *.css lua vim.lsp.buf.formatting()
