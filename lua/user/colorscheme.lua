-- vim.g.gruvbox_contrast_dark = "hard"
vim.o.background = "dark"
require("gruvbox").setup({
    underline = false,
    italic = false,
    contrast = "hard",
})
vim.cmd "colorscheme gruvbox"
