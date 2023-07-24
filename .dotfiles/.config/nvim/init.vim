lua << EOF

vim.opt.termguicolors = true
vim.loader.enable()

require('plugins')

require('ui/indent_blankline')
require('ui/tokyonight')

require('functionality/treesitter')

require('functionality/lsp')
require('functionality/cmp')

require('mason').setup {}
require('mason-lspconfig').setup {}

EOF

colorscheme tokyonight

set number
set cursorline
set showtabline=2

set ignorecase

set nowrap
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab
set cmdheight=0

syntax on
filetype plugin indent on

augroup FileTypeOptions
    autocmd!
    autocmd BufNewFile,BufRead *.sasm setfiletype asm
    autocmd FileType markdown noremap <F6> :MarkdownPreview <CR>
    autocmd FileType asm set tabstop=24 shiftwidth=24 softtabstop=24
augroup END

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap '' ''<Esc>i
inoremap -[ --[[<Esc>a

inoremap {<CR> {<CR>}<Esc>O
"inoremap jj <Esc>

noremap zz :noh<CR>

noremap <F4> :Telescope live_grep <CR>
