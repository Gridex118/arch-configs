lua << EOF

vim.opt.termguicolors = true

require('plugins')

require('ui/lualine')
require('lualine').setup{}
require('ui/tabby')
require('tabby')

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
    show_current_context = true,
    show_current_context_start = true,
}

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
