-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.del("n", "<C-/>")
-- vim.keymap.del("n", "<C-_>")

-- local opts = { silent = true, remap = true }
-- vim.keymap.set("o", "<C-/>", "gc", opts)
-- vim.keymap.set("x", "<C-/>", "gc", opts)
-- vim.keymap.set("v", "<C-/>", "gc", opts)
-- vim.keymap.set("n", "<C-/>", "gcc", opts)
-- vim.keymap.set("o", "<C-_>", "gc", opts)
-- vim.keymap.set("x", "<C-_>", "gc", opts)
-- vim.keymap.set("v", "<C-_>", "gc", opts)
-- vim.keymap.set("n", "<C-_>", "gcc", opts)

vim.api.nvim_set_keymap("t", "<esc><esc>", "<c-\\><c-n>", { noremap = true })
vim.api.nvim_set_keymap("i", "<M-CR>", "<esc>A;", { noremap = true })

-- TODO: Find a better way to do this
-- vim.api.nvim_set_keymap("t", "<C-w>h", "<c-\\><c-n><C-w>h", { noremap = true })
-- vim.api.nvim_set_keymap("t", "<C-w>j", "<c-\\><c-n><C-w>j", { noremap = true })
-- vim.api.nvim_set_keymap("t", "<C-w>k", "<c-\\><c-n><C-w>k", { noremap = true })
-- vim.api.nvim_set_keymap("t", "<C-w>l", "<c-\\><c-n><C-w>l", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<C-_>", ":8split +term<CR>", { noremap = true })
