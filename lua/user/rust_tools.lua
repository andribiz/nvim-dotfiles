-- Update this path
local extension_path = '/Users/andrix/.vscode/extensions/vadimcn.vscode-lldb-1.7.0/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'

local opts = {
    -- ... other configs
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    }
}
require("rust-tools").setup(opts)
-- require('rust-tools.inlay_hints').set_inlay_hints()
-- require('rust-tools.runnables').runnables()
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]]
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
