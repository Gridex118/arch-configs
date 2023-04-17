vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
    function()
        
        use 'wbthomason/packer.nvim'
        use 'feline-nvim/feline.nvim'
        use 'nvim-tree/nvim-web-devicons'
        use 'EdenEast/nightfox.nvim'
        use 'neovim/nvim-lspconfig'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'

    end
)
