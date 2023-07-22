vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

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
