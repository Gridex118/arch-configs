vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'rebelot/kanagawa.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use 'nanozuki/tabby.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'ggandor/leap.nvim'
    use 'tpope/vim-repeat'
    use 'kylechui/nvim-surround'
    use 'Houl/repmo-vim'
    use 'preservim/nerdtree'
end)
