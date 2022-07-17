local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use "windwp/nvim-ts-autotag" -- Autotag for tsx
    use "numToStr/Comment.nvim" -- Easily comment stuff
    use "kyazdani42/nvim-web-devicons"
    use { "kyazdani42/nvim-tree.lua", cmd = "NvimTreeToggle", config = "require 'user.nvim-tree'" }
    use { "akinsho/bufferline.nvim", event = "bufWinEnter", config = "require 'user.bufferline'" }
    -- use "moll/vim-bbye"
    use "akinsho/toggleterm.nvim"
    use "RRethy/vim-illuminate"
    -- use "ahmedkhalf/project.nvim" --Temp disabled
    use { "glepnir/dashboard-nvim", cmd = "Dashboard", config = "require 'user.dashboard'" }
    -- use "goolord/alpha-nvim"
    use { "lukas-reineke/indent-blankline.nvim", event = "BufRead", config = "require 'user.indent-blankline'" }
    use "kylechui/nvim-surround"
    -- color schemes
    use "morhetz/gruvbox"
    use { "nvim-lualine/lualine.nvim", event = "BufWinEnter", config = "require('user.lualine')" }
    -- use "vim-airline/vim-airline" -- themes airline
    -- use "vim-airline/vim-airline-themes"
    -- completion
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    -- snippet
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters an 
    -- use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use "nvim-lua/lsp_extensions.nvim" -- for inlay hint diagnostic
    use { "tomlion/vim-solidity", ft = { "solidity" } }
    use "j-hui/fidget.nvim" -- Lsp Progress
    use "ray-x/lsp_signature.nvim"
    -- Telescope
    use { "nvim-telescope/telescope.nvim" }
    use { 'nvim-telescope/telescope-ui-select.nvim' }
    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    -- Git
    use "lewis6991/gitsigns.nvim"
    -- debug
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "theHamsta/nvim-dap-virtual-text"
    use "nvim-telescope/telescope-dap.nvim"
    use {"folke/trouble.nvim", cmd="TroubleToggle", config="require 'trouble'.setup {}"}
    -- Rust
    use { "simrat39/rust-tools.nvim", ft = { "rust" }, config = "require 'user.rust_tools'" } -- for rust enhancement
    use {
        'saecki/crates.nvim',
        event = { "BufRead Cargo.toml" },
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            require('crates').setup()
        end,
    }
    -- Python 
    use { "mfussenegger/nvim-dap-python", ft = { "python" }, config = "require 'user.nvim-dap-python'" }
    -- Go
    use { "leoluz/nvim-dap-go", ft = { 'go' }, config = "require 'user.dap-go'" }
    -- Keyboard AI
    use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
