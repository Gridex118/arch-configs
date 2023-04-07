vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
    function()
        
        use 'wbthomason/packer.nvim'
        use 'feline-nvim/feline.nvim'
        use 'nvim-tree/nvim-web-devicons'
        use 'EdenEast/nightfox.nvim'

    end
)
