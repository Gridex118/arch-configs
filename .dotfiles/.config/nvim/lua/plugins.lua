vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
    function()
        
        use 'wbthomason/packer.nvim'
        use 'nvim-lualine/lualine.nvim'
        use 'nvim-tree/nvim-web-devicons'
        use 'EdenEast/nightfox.nvim'

    end
)
