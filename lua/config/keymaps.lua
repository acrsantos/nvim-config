-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>a", "<cmd>CMakeRun<cr>", { desc = "CMake Run" })
map("n", "<leader>ar", "<cmd>CMakeRun<cr>", { desc = "CMake Run" })
map("n", "<leader>as", "<cmd>CMakeSelectBuildType<cr>", { desc = "CMake Select Build Type" })
map("n", "<leader>ag", "<cmd>CMakeGenerate<cr>", { desc = "CMake Generate" })
map("n", "<leader>ab", "<cmd>CMakeBuild<cr>", { desc = "CMake Build" })
map("n", "<leader>ad", "<cmd>CMakeDebug<cr>", { desc = "CMake Debug" })
map("n", "<leader>ac", "<cmd>CMakeClean<cr>", { desc = "CMake Clean" })
map("n", "<leader>ai", "<cmd>CMakeInstall<cr>", { desc = "CMake Install" })

local wk = require("which-key")
wk.register({
  a = {
    name = "cmaketools",
    r = { "<cmd>CMakeRun<cr>", "CMake Run" },
    s = { "<cmd>CMakeSelectBuildType<cr>", "CMake Select Build Type" },
    g = { "<cmd>CMakeGenerate<cr>", "CMake Generate" },
    b = { "<cmd>CMakeBuild<cr>", "CMake Build" },
    d = { "<cmd>CMakeDebug<cr>", "CMake Debug" },
    c = { "<cmd>CMakeClean<cr>", "CMake Clean" },
    i = { "<cmd>CMakeInstall<cr>", "CMake Install" },
  },
}, { prefix = "<leader>" })
