-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.pumblend = 0
vim.opt.pumheight = 15
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.opt.termguicolors = true
vim.opt.scrolloff = 10

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.background = "dark"
-- vim.opt.colorcolumn = "120"

-- lua/config/options.lua

vim.o.guifont = "BerkeleyMono Nerd Font:h15"

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "single",
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  -- Use a sharp border with `FloatBorder` highlights
  border = "single",
  -- title = "hover",
})

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--   virtual_text = {
--     severity = { min = vim.diagnostic.severity.ERROR },
--   },
-- })

vim.diagnostic.config({
  float = {
  },
})

vim.opt.fillchars = {eob = " "}
vim.opt.termsync = false

vim.g.rustaceanvim = {
  tools = {
    float_win_config = {
      border = "single",
    }
  }
}
