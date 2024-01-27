local FSHOME = vim.fn.expand("$HOME")

local texInfo = {}
-- all tex files are stored in the $HOME/.authoring/<projectName>/ directory
_, _, texInfo.projectName = string.find(vim.fn.expand('%:~'), "authoring/([^/]*)/")
_, _, texInfo.fileName = string.find(vim.fn.expand('%:t'), "([^.]*)")
texInfo.rootDir = FSHOME .. "/.authoring/" .. texInfo.projectName
texInfo.outDir = texInfo.rootDir .. "/pdf/"
texInfo.auxDir = FSHOME .. "/.texbuild/"
texInfo.target = vim.fn.expand('%:.')
texInfo.pdf = texInfo.outDir .. texInfo.fileName .. ".pdf"


-- make pdf from tex file; intended for single tex files, with no input statements
local function get_pdf_make_command()
    local options = " -quiet -pdf -f -auxdir=" .. texInfo.auxDir .. " -outdir=" .. texInfo.outDir .. " "
    local redirection = " 2>/tmp/tex.log"
    return ":!latexmk" .. options .. texInfo.target .. redirection .. "<CR>"
end


vim.keymap.set(
    'n', "<space><space>c", get_pdf_make_command(), { noremap = true, silent = true, }
)
vim.keymap.set( 'n', "<space><space>m", ":!cd .. && mktex<CR>", { noremap = true, } )
vim.keymap.set(
    'n', "<space><space>z", ":!zathura " .. texInfo.pdf .. "&<CR><CR>", { noremap = true, }
)

vim.keymap.set( 'n', "<space><space>f", ":set filetype=tex<CR>", { noremap = true, } )
vim.keymap.set( 'n', "<space>tt", ":b 1 | set filetype=tex<CR>", { noremap = true, } )
vim.keymap.set( 'n', "<space>tn", ":bnext | set filetype=tex<CR>", { noremap = true, } )
vim.keymap.set( 'n', "<space>tN", ":bprevious | set filetype=tex<CR>", { noremap = true, } )

