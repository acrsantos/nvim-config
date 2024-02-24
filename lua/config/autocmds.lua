-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "cpp", "html", "css" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- local luasnip = require("luasnip")
-- local unlinkgrp = vim.api.nvim_create_augroup("UnlinkSnippetOnModeChange", { clear = true })
-- vim.api.nvim_create_autocmd("ModeChanged", {
--   group = unlinkgrp,
--   pattern = { "s:n", "i:*" },
--   desc = "Forget the current snippet when leaving the insert mode",
--   callback = function(evt)
--     if luasnip.session and luasnip.session.current_nodes[evt.buf] and not luasnip.session.jump_active then
--       luasnip.unlink_current()
--     end
--   end,
-- })

local ls = require("luasnip")
vim.api.nvim_create_autocmd("CursorMovedI", {
  pattern = "*",
  callback = function(ev)
    if not ls.session or not ls.session.current_nodes[ev.buf] or ls.session.jump_active then
      return
    end

    local current_node = ls.session.current_nodes[ev.buf]
    local current_start, current_end = current_node:get_buf_position()
    current_start[1] = current_start[1] + 1 -- (1, 0) indexed
    current_end[1] = current_end[1] + 1 -- (1, 0) indexed
    local cursor = vim.api.nvim_win_get_cursor(0)

    if
      cursor[1] < current_start[1]
      or cursor[1] > current_end[1]
      or cursor[2] < current_start[2]
      or cursor[2] > current_end[2]
    then
      ls.unlink_current()
    end
  end,
})
