lua <<EOF

require('plugins')

require('ui/lualine')
require('lualine').setup{}
require('ui/tabby')
require('tabby')

require('treesitter_setup')

require('lsp_setup')
require('autocmp')

require('leap').add_default_mappings()
require('leap_setup')

require('nvim-surround').setup{}

require('mason').setup{}
require('mason-lspconfig').setup{}

EOF

colorscheme kanagawa-dragon

set nowrap
syntax on
filetype plugin indent on
set tabstop=4 shiftwidth=4
set expandtab

set cmdheight=0

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap '' ''<Esc>i

inoremap {<CR> {<CR>}<Esc>O
inoremap jj <Esc>

noremap zz :noh<Enter>

noremap <F5> :NERDTreeToggle <CR>
noremap <F4> :Telescope live_grep <CR>
