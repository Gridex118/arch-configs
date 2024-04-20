local FSHOME = vim.fn.expand("$HOME")

local texInfo = {}
-- all tex projects are stored in the $HOME/authoring/<projectName>/ directory
_, _, texInfo.projectName = string.find(vim.fn.expand('%:~'), "authoring/([^/]*)/")
if not (texInfo.projectName == nil) then
    texInfo.isProject = true
    _, _, texInfo.fileName = string.find(vim.fn.expand('%:t'), "([^.]*)")
    texInfo.rootDir = FSHOME .. "/authoring/" .. texInfo.projectName
    texInfo.outDir = texInfo.rootDir .. "/pdf/"
    texInfo.auxDir = FSHOME .. "/.texbuild/"
    texInfo.target = vim.fn.expand('%:.')
    texInfo.pdf = texInfo.outDir .. texInfo.fileName .. ".pdf"
else
    texInfo.isProject = false
end


-- make pdf from tex file; intended for single tex files, with no input statements
local function get_pdf_make_command()
    local options = " -quiet -lualatex -f -auxdir=" .. texInfo.auxDir .. " -outdir=" .. texInfo.outDir .. " "
    local redirection = " 2>/tmp/tex.log"
    return ":!latexmk" .. options .. texInfo.target .. redirection .. "<CR>"
end


local function setup_commands()
    vim.keymap.set(
        'n', "<space><space>c", get_pdf_make_command(), { noremap = true, silent = true, }
    )
    vim.keymap.set( 'n', "<space><space>M", ":!cd .. && mktex<CR>", { noremap = true, } )
    vim.keymap.set( 'n', "<space><space>m", ":!mktex<CR>", { noremap = true, } )
    vim.keymap.set(
        'n', "<space><space>z", ":!zathura " .. texInfo.pdf .. "&<CR><CR>", { noremap = true, }
    )

    vim.keymap.set( 'n', "<space><space>f", ":set filetype=tex<CR>", { noremap = true, } )
    vim.keymap.set( 'n', "<space>tt", ":b 1 | set filetype=tex<CR>", { noremap = true, } )
    vim.keymap.set( 'n', "<space>tn", ":bnext | set filetype=tex<CR>", { noremap = true, } )
    vim.keymap.set( 'n', "<space>tN", ":bprevious | set filetype=tex<CR>", { noremap = true, } )
end

if texInfo.isProject then
    setup_commands();
end
