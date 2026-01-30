vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fs.joinpath(vim.fn.stdpath("cache"), "undodir")
vim.opt.wrap = false

vim.g.netrw_banner = false
vim.g.netrw_liststyle = 3
vim.g.netrw_bufsettings = "noma nomod nonu nobl nowrap ro rnu"

vim.opt.wildmenu = true
vim.cmd("set path+='**'")
vim.opt.filetype = "on"

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.hlsearch = false
vim.opt.incsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.pack.add {
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },

    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/tpope/vim-surround" },
}

vim.lsp.enable {
    "clangd",
    "pylsp",
    "lua_ls",
}

require "mason".setup()
require "mason-lspconfig".setup()

require "nvim-treesitter.config".setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
    },
    indent = {
        enable = true,
    },
    ensure_installed = "maintained",
    sync_install = false,
    auto_install = true,
    install_dir = vim.fs.joinpath(vim.fn.stdpath('data') --[[@as string]], 'site'),
}

vim.lsp.config("pylsp", {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    maxLineLength = 120
                }
            }
        }
    }
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "require", }
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        }
    }
})

