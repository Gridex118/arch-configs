set termguicolors

" Plugins
lua require('plugins')
lua require('feline_nightfox')
lua require('feline').setup()
lua require('feline').winbar.setup()
lua require('lspconfig_settings')
lua require('cmpletion')

" Other
colorscheme nightfox
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set nowrap

syntax on
filetype plugin indent on

inoremap jj <esc>
noremap <S-Right> :tabn <Return>
noremap <S-left> :tabp <Return>
inoremap {<CR> {<CR>}<Esc>O
inoremap {<Space> {}<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

