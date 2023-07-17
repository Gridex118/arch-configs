set termguicolors

lua << EOF

require('plugins')

require('ui/lualine')
require('ui/tabby')
require('ui/indent_blankline')

require('treesitter_setup')

require('lsp_setup')
require('autocmp')

require('leap').add_default_mappings()
require('leap_setup')

require('nvim-surround').setup{}

require('mason').setup{}
require('mason-lspconfig').setup{}

EOF

colorscheme tokyonight-night

set number
set cursorline

au BufNewFile,BufRead *.sasm setfiletype asm

au FileType markdown noremap <F6> :MarkdownPreview <CR>

set ignorecase

set nowrap
syntax on
filetype plugin indent on
set tabstop=4 shiftwidth=4
au FileType asm set tabstop=24 shiftwidth=24
set expandtab
set cmdheight=0

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap '' ''<Esc>i

inoremap {<CR> {<CR>}<Esc>O
"inoremap jj <Esc>

noremap zz :noh<CR>

noremap <F4> :Telescope live_grep <CR>
