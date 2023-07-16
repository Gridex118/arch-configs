lua << EOF

vim.opt.termguicolors = true

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

augroup Colors
    autocmd!
    autocmd ColorScheme kanagawa-dragon
             \   highlight Normal guibg=none
             \ | highlight LineNr guibg=none
augroup END

colorscheme kanagawa-dragon

set number
set cursorline

au BufNewFile,BufRead *.sasm setfiletype asm
au FileType md PencilHard

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

noremap zz :noh<Enter>

noremap <F5> :NERDTreeToggle <CR>
noremap <F4> :Telescope live_grep <CR>
