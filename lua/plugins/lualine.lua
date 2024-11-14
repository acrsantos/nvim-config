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
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 1 } },
          {
            "filename",
            symbols = { modified = "  ", readonly = "", unnamed = "" },
          },
        },
        lualine_x = {},
        lualine_y = {
          {
            "diagnostics",
            padding = { left = 1, right = 1 },
            -- symbols = {
            --   error = " ",
            --   warn = " ",
            --   info = " ",
            --   hint = "󰝶 ",
            -- },
          },
          {
            "diff",
            -- symbols = {
            --   added = icons.git.added,
            --   modified = icons.git.modified,
            --   removed = icons.git.removed,
            -- },
          },
        },
        lualine_z = {
          {
            "progress",
          },
          {
            "location",
          },
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
