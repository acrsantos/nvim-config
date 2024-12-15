-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.pumblend = 0
vim.opt.pumheight = 15
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.termsync = false
vim.opt.fillchars = { eob = " " }
vim.opt.background = "dark"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.colorcolumn = "120"

vim.o.guifont = "BerkeleyMono Nerd Font:h15"
vim.diagnostic.config({ float = { border = "single", }, })

-- Plugins
vim.g.rustaceanvim = { tools = { float_win_config = { border = "single", } } }
vim.g.snacks_animate = false
