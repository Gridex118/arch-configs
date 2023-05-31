lua require('plugins')

colorscheme kanagawa-dragon

lua require('ui/lualine')
lua require('lualine').setup{}
lua require('ui/tabby')
lua require('tabby')

lua require('treesitter_setup')

lua require('lsp_setup')
lua require('autocmp')

lua require('leap').add_default_mappings()
lua require('leap_setup')

lua require('nvim-surround').setup{}

set nowrap
syntax on
filetype plugin indent on
set tabstop=4 shiftwidth=4
set expandtab

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap '' ''<Esc>i

inoremap {<CR> {<CR>}<Esc>O
inoremap jj <Esc>

noremap zz :noh<Enter>

noremap <F5> :NERDTreeToggle <CR>
