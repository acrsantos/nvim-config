-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- require('vim._extui').enable({})

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.opt.pumblend = 0
vim.opt.pumheight = 15
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.termsync = false
vim.opt.fillchars = { eob = " " }
vim.opt.background = "dark"
vim.opt.winborder = 'single'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.linespace = 5

vim.o.exrc = true

vim.lsp.enable('qmlls')
vim.lsp.config('qmlls', {
  cmd = {"qmlls6", "-E"},
  filetypes = { 'qml', 'qmljs' },
  root_markers = { '.git' },
})

vim.o.guifont = "Berkeley Mono:h14"

vim.diagnostic.config({
  -- virtual_lines = {
  --   current_line = true,
  -- }
  -- virtual_lines = true
})
  -- Plugins
vim.g.snacks_animate = false
