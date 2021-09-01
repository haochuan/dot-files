function format_prettier()
   return {
     exe = "prettier",
     args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
     stdin = true
   }
end

require("formatter").setup(
  {
    logging = true,
    filetype = {
      typescriptreact = { format_prettier },
      typescript = { format_prettier },
      javascript = { format_prettier },
      javascriptreact = { format_prettier },
      json = { format_prettier },
      html = { format_prettier },
      css = { format_prettier },
      markdown = { format_prettier },
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
    }
  }
)

vim.api.nvim_set_keymap('n', '<F5>', '<Cmd>:Format<CR>', { noremap = true, silent = false })

-- auto format on save
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.md,*.json,*.css,*.scss,*.html,*.rs,*.lua FormatWrite
augroup END
]], true)
