-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c", "cpp", "*" },
  callback = function()
    vim.b.autoformat = false
  end,
})

local luasnip = require("luasnip")
local unlinkgrp = vim.api.nvim_create_augroup("UnlinkSnippetOnModeChange", { clear = true })
vim.api.nvim_create_autocmd("ModeChanged", {
  group = unlinkgrp,
  pattern = { "s:n", "i:*" },
  desc = "Forget the current snippet when leaving the insert mode",
  callback = function(evt)
    if luasnip.session and luasnip.session.current_nodes[evt.buf] and not luasnip.session.jump_active then
      luasnip.unlink_current()
    end
  end,
})

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

local group = vim.api.nvim_create_augroup("TermBufNoLineNumbers", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  group = group,
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd({"BufLeave", "WinLeave"}, {
    pattern = "*",
    callback = function()
        vim.opt_local.cursorline = false
    end
})

-- Show cursor and cursorline when buffer gains focus
vim.api.nvim_create_autocmd({"BufEnter", "WinEnter"}, {
    pattern = "*",
    callback = function()
        vim.opt_local.cursorline = true
    end
})

vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
    pattern = { "*" },
    callback = function()
        if vim.opt.buftype:get() == "terminal" then
            vim.cmd(":startinsert")
        end
    end
})

-- Hide cmd line
-- vim.opt.cmdheight = 0
-- vim.api.nvim_create_autocmd('CmdlineEnter', {
--     group = vim.api.nvim_create_augroup(
--         'cmdheight_1_on_cmdlineenter',
--         { clear = true }
--     ),
--     desc = 'Don\'t hide the status line when typing a command',
--     command = ':set cmdheight=1',
-- })
--
-- vim.api.nvim_create_autocmd('CmdlineLeave', {
--     group = vim.api.nvim_create_augroup(
--         'cmdheight_0_on_cmdlineleave',
--         { clear = true }
--     ),
--     desc = 'Hide cmdline when not typing a command',
--     command = ':set cmdheight=0',
-- })
--
-- vim.api.nvim_create_autocmd('BufWritePost', {
--     group = vim.api.nvim_create_augroup(
--         'hide_message_after_write',
--         { clear = true }
--     ),
--     desc = 'Get rid of message after writing a file',
--     pattern = { '*' },
--     command = 'redrawstatus',
-- })
