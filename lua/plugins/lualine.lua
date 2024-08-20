return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = function()
    local icons = require("lazyvim.config").icons
    local Util = require("lazyvim.util")

    return {
      options = {
        component_separators = { left = " ", right = " " },
        theme = "auto",
        globalstatus = true,
        section_separators = { left = "", right = "" },
        disabled_filetypes = { statusline = { "dashboard", "alpha" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { { "branch", icon = "" } },
        lualine_c = {
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          {
            "filename",
            symbols = { modified = "  ", readonly = "", unnamed = "" },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            -- diagnostics_color = {
            --   error = "lualine_a_normal", -- Changes diagnostics' error color.
            --   warn = "lualine_a_normal", -- Changes diagnostics' warn color.
            --   info = "lualine_a_normal", -- Changes diagnostics' info color.
            --   hint = "lualine_a_normal", -- Changes diagnostics' hint color.
            -- },
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󰝶 ",
            },
          },
        },
        lualine_y = {
          {
            "diff",
            diff_color = {
              added = { fg = "#08e7c5", bg = "#262933" },
              modified = { fg = "#fee56c", bg = "#262933" },
              removed = { fg = "#8e0f3a", bg = "#262933" },
            },
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
          },
        },
        lualine_z = {
          {
            "progress",
          },
          {
            "location",
          },
          -- function()
          --   return os.date("%X")
          -- end,
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
