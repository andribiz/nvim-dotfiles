local options = {
    tabstop = 4,
    softtabstop = 4,
    autoindent = true,
    number = true,
    relativenumber = true,
    -- colorcolumn = 90, -- to do not working error syntax
    mouse = "a",
    showmatch = true,
    ignorecase = true,
    hlsearch = true,
    incsearch = true,
    fileencoding = "utf-8",
    clipboard = "unnamedplus",
    expandtab = true,
    shiftwidth = 4,
    cursorline = true,
    ttyfast = true,
    smartindent = true,
    writebackup = false,
    splitbelow = true,
    ruler = true,
    splitright = true,
    swapfile = false,
    termguicolors = true,
    updatetime = 300
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
