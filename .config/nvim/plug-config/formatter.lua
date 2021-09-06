function format_prettier_single_quote()
   return {
     exe = "prettier",
     args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
     stdin = true
   }
end

function format_prettier()
   return {
     exe = "prettier",
     args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
     stdin = true
   }
end

function format_rustfmt()
   return {
     exe = "rustfmt",
     args = {"--emit=stdout"},
     stdin = true
   }
end

require("formatter").setup(
  {
    logging = true,
    filetype = {
      typescriptreact = { format_prettier_single_quote },
      typescript = { format_prettier_single_quote },
      javascript = { format_prettier_single_quote },
      javascriptreact = { format_prettier_single_quote },
      json = { format_prettier },
      html = { format_prettier },
      css = { format_prettier },
      markdown = { format_prettier },
      rust = { format_rustfmt },
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
