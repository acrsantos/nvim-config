return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local icons = require("lazyvim.config").icons
    local Util = require("lazyvim.util")
    local colors = {
      blue = "#2AC3DE",
      green = "#3effdc",
      violet = "#ff61ef",
      yellow = "#ffda7b",
      red = "#ff4a4a",
      fg = "#c3ccdc",
      bg = "#112638",
      inactive_bg = "#2c3043",
    }

    return {
      options = {
        component_separators = { left = " ", right = " " },
        theme = "auto",
        -- theme = {
        --   normal = {
        --     a = { fg = colors.blue, bg = colors.none },
        --     b = { fg = colors.cyan, bg = colors.none },
        --     c = { fg = colors.fg, bg = colors.none },
        --     x = { fg = colors.fg, bg = colors.none },
        --     y = { fg = colors.magenta, bg = colors.none },
        --     z = { fg = colors.grey, bg = colors.none },
        --   },
        --   insert = {
        --     a = { fg = colors.green, bg = colors.none },
        --     z = { fg = colors.grey, bg = colors.none },
        --   },
        --   visual = {
        --     a = { fg = colors.magenta, bg = colors.none },
        --     z = { fg = colors.grey, bg = colors.none },
        --   },
        --   terminal = {
        --     a = { fg = colors.orange, bg = colors.none },
        --     z = { fg = colors.grey, bg = colors.none },
        --   },
        -- },

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
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󰝶 ",
            },
          },
        },
        lualine_x = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = colors.green },
          },
          {
            "diff",
            colored = true,
            diff_color = {
              added = { fg = colors.green },
              modified = { fg = colors.blue },
              removed = { fg = colors.red },
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
            return "  " .. os.date("%X")
          end,
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
