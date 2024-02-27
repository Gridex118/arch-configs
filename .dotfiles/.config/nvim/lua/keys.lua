local key_opts = {noremap = true, silent = true}

local function imap(key, cmd)
    vim.keymap.set('i', key, cmd, key_opts)
end

imap('(',       "()<Esc>i")
imap('[',       "[]<Esc>i")
imap('{',       "{}<Esc>i")
imap("''",      "''<Esc>i")
imap('""',      '""<Esc>i')
imap("{<cr>",   "{<cr>}<Esc>O")
imap("{<Space>",   "{  }<Esc>hi")
imap("-[",      "-[[<Esc>a")
imap("-]",      "-]]<Esc>a")

-- vim.keymap.set('i', "jj", "<Esc>", key_opts)
vim.keymap.set('n', "zz", ":noh<cr>", key_opts)

vim.keymap.set('n', "<Space>/", ":Telescope live_grep <cr>", key_opts)

-- Oil.nvim
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set( 'n', "<space>q", ":bdel<CR>", key_opts )

-- Neovim terminal
vim.keymap.set("n", "<space>tr", ":split term://zsh || resize -5<CR><CR>i", key_opts)

vim.keymap.set("n", "g?", ":lua vim.diagnostic.open_float()<CR>", key_opts)
