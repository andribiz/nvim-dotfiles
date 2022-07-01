require("rust-tools").setup()
-- require('rust-tools.inlay_hints').set_inlay_hints()
-- require('rust-tools.runnables').runnables()
vim.cmd[[
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
]]

