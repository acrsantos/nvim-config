-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4

local wk = require("which-key")
wk.register({
  c = {
    c = { "<cmd>CMakeRun<cr>", "CMake Run" },
    t = { "<cmd>CMakeSelectBuildType<cr>", "CMake Select Build Type" },
    g = { "<cmd>CMakeGenerate<cr>", "CMake Generate" },
    b = { "<cmd>CMakeBuild<cr>", "CMake Build" },
    D = { "<cmd>CMakeDebug<cr>", "CMake Debug" },
    i = { "<cmd>CMakeInstall<cr>", "CMake Install" },
  },
}, { prefix = "<leader>" })
