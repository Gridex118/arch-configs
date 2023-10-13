local key_opts = {noremap = true,}

vim.keymap.set('i', '(', "()<Esc>i", key_opts)
vim.keymap.set('i', '[', "[]<Esc>i", key_opts)
vim.keymap.set('i', '{', "{}<Esc>i", key_opts)
vim.keymap.set('i', "''", "''<Esc>i", key_opts)
vim.keymap.set('i', '"', '""<Esc>i', key_opts)

vim.keymap.set('i', "{<cr>", "{<cr>}<Esc>O", key_opts)
vim.keymap.set('i', "-[", "-[[<Esc>a", key_opts)
vim.keymap.set('i', "-]", "-]]<Esc>a", key_opts)

-- vim.keymap.set('i', "jj", "<Esc>", key_opts)
vim.keymap.set('n', "zz", ":noh<cr>", key_opts)

vim.keymap.set('n', "<F4>", ":Telescope live_grep <cr>", key_opts)
