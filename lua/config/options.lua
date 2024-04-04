-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.pumblend = 0
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.opt.termguicolors = true
vim.opt.scrolloff = 10

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- lua/config/options.lua

vim.o.guifont = "JetBrainsMono NF:h09"

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
    border = "single",
  },
})

vim.g.html_number_lines = 1
vim.api.nvim_create_user_command("RichTextCopy", function(args)
  local saved_html_use_css = vim.g.html_use_css
  local saved_html_no_progress = vim.g.html_no_progress
  vim.g.html_use_css = false
  vim.g.html_no_progress = true
  vim.cmd({
    cmd = "TOhtml",
    range = { args.line1, args.line2 },
  })
  vim.g.html_use_css = saved_html_use_css
  vim.g.html_no_progress = saved_html_no_progress
  vim.g.html_number_lines = false

  vim.cmd("w !wl-copy -t text/html ")
  vim.cmd.bwipeout({ bang = true })
end, {
  range = "%",
})

vim.opt.listchars = {
  tab = "  ",
  trail = " ",
  nbsp = "+",
}
