lua require('plugins')

colorscheme duskfox

lua require('feline_setup')
lua require('feline').setup()

lua require('tabby_setup')
lua require('tabby')

lua require('lsp_setup')
lua require('autocmp')

lua require('leap').add_default_mappings()
lua require('leap_setup')

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
