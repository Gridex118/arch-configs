vim.loader.enable()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('plugins')

require('options')

vim.cmd([[

    syntax on
    filetype plugin indent on

    augroup FileTypeOptions
        autocmd!
        autocmd BufNewFile,BufRead *.sasm setfiletype asm
        autocmd BufNewFile,BufRead *.bf setfiletype text
        autocmd FileType asm set tabstop=24 shiftwidth=24 softtabstop=24
    augroup END

    augroup ZshHighlighting
        autocmd!
        autocmd BufNewFile,BufRead .zalias setfiletype sh
        autocmd BufNewFile,BufRead .zfunctions setfiletype sh
    augroup END

    augroup LaTeX
        autocmd!
        "compile latex
        autocmd FileType tex noremap ztx :!latexmk -quiet -pdf -auxdir=$HOME/.texbuild/ '%:t' 1>/dev/null 2>&1 <CR> <CR>
    augroup END

    augroup Folding
        autocmd!
        set foldmethod=expr
        set foldexpr=nvim_treesitter#foldexpr()
        autocmd BufEnter * normal zR
        autocmd BufRead * normal zR
    augroup END

]])

require('keybinds')

