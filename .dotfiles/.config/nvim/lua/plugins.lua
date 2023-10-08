require("lazy").setup({
    {
        "folke/tokyonight.nvim",
        lazy = false,
        config = function()
            require('ui.tokyonight')
            vim.cmd([[colorscheme tokyonight]])
        end,
    },

    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },

    {
        "nvim-lualine/lualine.nvim",
        after = "tokyonight.nvim",
        event = "BufEnter",
        config = function()
            require('ui.lualine')
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require('functionality.lsp')
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        config = function()
            require('functionality.cmp')
        end,
    },

    {
        "hrsh7th/cmp-nvim-lsp",
    },

    {
        "hrsh7th/cmp-buffer",
    },

    {
        "hrsh7th/cmp-path",
    },

    {
        "hrsh7th/cmp-cmdline",
    },

    {
        "hrsh7th/vim-vsnip",
    },

    {
        "hrsh7th/vim-vsnip-integ",
    },

    {
        "ggandor/leap.nvim",
        event = "BufEnter",
        config = function ()
            require('functionality.leap')
        end,
    },

    {
        "kylechui/nvim-surround",
        version = '*',
        event = "VeryLazy",
        config = function()
            require('nvim-surround').setup {}
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require('functionality.treesitter')
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
    },

    {
        "nvim-lua/plenary.nvim",
    },

    {
        "BurntSushi/ripgrep",
    },

    {
        "williamboman/mason.nvim", 
        config = function()
            require('mason').setup {}
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require('mason-lspconfig').setup {}
        end,
    },

    {
        "iamcco/markdown-preview.nvim",
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require('ui.indent_blankline')
        end,
    },

})
