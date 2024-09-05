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
        lualine_x = {},
        lualine_y = {
          {
            "diagnostics",
            -- diagnostics_color = {
            --   error = "lualine_a_normal", -- Changes diagnostics' error color.
            --   warn = "lualine_a_normal", -- Changes diagnostics' warn color.
            --   info = "lualine_a_normal", -- Changes diagnostics' info color.
            --   hint = "lualine_a_normal", -- Changes diagnostics' hint color.
            -- },
            padding = { left = 1, right = 0 },
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󰝶 ",
            },
          },
          {
            "diff",
            -- diff_color = {
            --   added = { fg = "auto", bg = "auto" },
            --   modified = { fg = "auto", bg = "auto" },
            --   removed = { fg = "auto", bg = "auto" },
            -- },
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
