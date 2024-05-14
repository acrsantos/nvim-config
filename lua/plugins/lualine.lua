return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
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
            diagnostics_color = {
              error = "lualine_a_normal", -- Changes diagnostics' error color.
              warn = "lualine_a_normal", -- Changes diagnostics' warn color.
              info = "lualine_a_normal", -- Changes diagnostics' info color.
              hint = "lualine_a_normal", -- Changes diagnostics' hint color.
            },
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󰝶 ",
            },
          },
          {
            "diff",
            colored = true,
            diff_color = {
              added = { fg = "#16181d", bg = "#f6f8ff" },
              modified = { fg = "#16181d", bg = "#f6f8ff" },
              removed = { fg = "#16181d", bg = "#f6f8ff" },
            },
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
          },
        },
        lualine_y = {
          {
            "progress",
          },
          {
            "location",
            -- color = { fg = colors.green, bg = colors.none },
          },
        },
        lualine_z = {
          function()
            return os.date("%X")
          end,
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
