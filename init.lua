vim.g.mapleader = " "

require "paq" {
    "savq/paq-nvim";
    "OmniSharp/omnisharp-vim";
    "preservim/nerdtree";
    "dense-analysis/ale";
    "BurntSushi/ripgrep";
    "nvim-lua/plenary.nvim";
    {"nvim-telescope/telescope.nvim", branch="0.1.x"};
    "prabirshrestha/asyncomplete.vim";
    "mhinz/vim-signify";
    {"neoclide/coc.nvim",·branch="release"};
    {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
    "morhetz/gruvbox",
    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-web-devicons",
    "VonHeikemen/lsp-zero.nvim",
    "terrortylor/nvim-comment",
    "akinsho/toggleterm.nvim",
    "chrisbra/unicode.vim"
}

-- TREESITTER
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "vim", "go", "javascript", "typescript", "rust"},
        highlight = {
                enable = true,
        }
}

-- LUALINE
require("lualine").setup{
        options = {
                icons_enabled = false,
                theme = "onedark",
                component_separators = "|",
                section_separators = "",
        },
}

-- LSP-Zero
local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
        "tsserver",
        "gopls",
        "eslint",
        "rust_analyzer",
        "csharp_ls",
})

lsp.set_preferences({
        sign_icons = {
            error = "❌",
            warn  = "⚠",
            hint = "💡",
            info = "💁",
        }
})

lsp.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>w", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", ">e", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "<e", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-_>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.formatting() end, opts)
        vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set('n', 'gty', function() vim.lsp.buf.type_definition() end, opts)
end)

lsp.setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
                signs = true,
                virtual_text = true,
                underline = false,
        }
)

-- COMMENT
require("nvim_comment").setup({
    operator_mapping = "<leader>cc"
})

-- TERMINAL SETUP
require("toggleterm").setup{
        direction = "horizontal",
        size = 90,
        open_mapping = [[<leader>tt]],
        modifiable = true
}

-- COLORSCHEME
vim.cmd("colorscheme gruvbox")
-- Adding the same comment color in each theme
vim.cmd([[
        augroup CustomCommentCollor
                autocmd!
                autocmd VimEnter * hi Comment guifg=#2ea542
        augroup END
]])

local wo = vim.wo
local g = vim.g
local opt = vim.opt
local o = vim.o

-- show line numbers
wo.number = true
-- use .NET 6 compiler
g.OmniSharp_server_use_net6 = 1
-- No text wrap
opt.wrap = false
-- disable backup files
opt.backup = false
-- everything in utf-8
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.termencoding = "utf-8"

-- Tab settings
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Search Settings
o.hlsearch = true
o.breakindent = true
o.ignorecase = true

-- Advanced undo buffer
opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
o.undofile = true

-- general settings
o.updatetime = 50
o.background = "dark"
opt.guicursor = "i:block"
o.mouse = 'a'
o.timeout = true
o.timeoutlen = 300
o.termguicolors = true
-- use systemclipboard for copy
opt.clipboard=unnamed
-- highlight current line
opt.cursorline=true
-- show vertical line after 120chars
opt.textwidth=120

-- show unwanted whitespaces in red
vim.cmd([[
        highlight ExtraWhitespace ctermbg=red guibg=red
        match ExtraWhitespace /\s\+$/
        autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
        autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
        autocmd InsertLeave * match ExtraWhitespace /\s\+$/
        autocmd BufWinLeave * call clearmatches()
]])

-- Key mappings
vim.keymap.set("n", "<leader>pn", ":NERDTree<CR>", { noremap = true })
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })
vim.keymap.set("n", "<leader>ft", ":Telescope live_grep<CR>", { noremap = true })
vim.keymap.set("n", "<leader>uni", ":UnicodeSearch!", { noremap = true })
vim.keymap.set("n", "<leader>bf", vim.cmd.Ex)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)