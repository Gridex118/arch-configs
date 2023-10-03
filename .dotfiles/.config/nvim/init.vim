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
    autocmd BufNewFile,BufRead *.bf setfiletype text
    autocmd FileType markdown noremap <F6> :MarkdownPreview <CR>
    autocmd FileType asm set tabstop=24 shiftwidth=24 softtabstop=24
augroup END

augroup ZshHighlighting
    autocmd!
    autocmd BufNewFile,BufRead .zalias setfiletype sh
    autocmd BufNewFile,BufRead .zfunctions setfiletype sh
augroup END

augroup Folding
    autocmd!
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    autocmd BufEnter * normal zR
augroup END

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap " ""<Esc>i
inoremap '' ''<Esc>i
inoremap -[ --[[<Esc>a

"inoremap jj <Esc>

noremap zz :noh<CR>

noremap gb :bnext<CR>
noremap gB :bprevious<CR>

noremap <F4> :Telescope live_grep <CR>

