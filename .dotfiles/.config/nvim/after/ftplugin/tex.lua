-- make pdf from tex file
local function get_pdf_make_command()
    local texFile = vim.fn.expand('%:.')
    local outDir = vim.fn.expand('%:h') .. "/pdf/"
    local auxDir = vim.fn.expand("$HOME") .. "/.texbuild/"
    local options = " -quiet -pdf -f -auxdir=" .. auxDir .. " -outdir=" .. outDir .. " "
    local redirection = " 1>/tmp/tex.log 2>&1 "

    return ":!latexmk" .. options .. texFile .. redirection .. "<CR><CR>"
end


vim.keymap.set(
    'n', "ztx", get_pdf_make_command(), { noremap = true, }
)
