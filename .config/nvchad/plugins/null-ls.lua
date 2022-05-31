local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

   -- webdev stuff
   -- b.formatting.deno_fmt,
   b.formatting.prettierd,

   -- Lua
   -- b.formatting.stylua,

   -- Shell
   -- b.formatting.shfmt,
   -- b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

   -- cpp
   -- b.formatting.clang_format,

   -- Rust
   b.formatting.rustfmt.with { extra_args = { "--edition=2021" } },
}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,

      -- format on save
      on_attach = function(client, bufnr)
         if client.supports_method("textDocument/formatting") then
             vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
             vim.api.nvim_create_autocmd("BufWritePre", {
                 group = augroup,
                 buffer = bufnr,
                 callback = function()
                     -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                     vim.lsp.buf.formatting_sync()
                 end,
             })
         end
      end,
   }
end

return M

