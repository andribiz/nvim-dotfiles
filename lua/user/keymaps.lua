local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- Resize with arrows
-- this is not working
keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Down>", ":resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)


-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("n", "x", '"_x', opts)

keymap("n", "<leader>e", ":NvimTreeToggle <CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
-- Telescope
keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<C-S-f>", "<cmd>Telescope live_grep<cr>", opts)

-- my preferences
keymap("n", "<C-s>", "<cmd>:w<cr>", opts) -- save
keymap("i", "<C-s>", "<Esc>:w<cr>", opts) -- save
keymap("n", "Q", "<cmd>:bd<cr>", opts)
keymap("n", "<leader>t", "<cmd>:ToggleTerm<cr>", opts)

-- LSP Shortcut
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", opts)
keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
keymap("n", "<leader>c", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", opts)
keymap("n", "<leader>t", ":ToggleTerm direction=horizontal size=20<cr>", opts)
keymap("n", "<leader>o", ":TroubleToggle<cr>", opts)

-- Debugging
keymap("n", "<F5>", ":lua require'dap'.continue()<cr>", opts)
keymap("n", "<F8>", ":lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F9>", ":lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F10>", ":lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
keymap("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", opts)
keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<cr>", opts)
keymap("n", "<leader>dt", ":lua require'dap-go'.debug_test()<cr>", opts)
keymap("n", "<leader>x", ":lua require('dap').terminate()<cr>", opts)
