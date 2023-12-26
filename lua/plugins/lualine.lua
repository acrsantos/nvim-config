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

    -- local my_lualine_theme = {
    --   normal = {
    --     a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   insert = {
    --     a = { bg = colors.green, fg = colors.bg, gui = "bold" },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   visual = {
    --     a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   command = {
    --     a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   replace = {
    --     a = { bg = colors.red, fg = colors.bg, gui = "bold" },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   inactive = {
    --     a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
    --     b = { bg = colors.inactive_bg, fg = colors.semilightgray },
    --     c = { bg = colors.inactive_bg, fg = colors.semilightgray },
    --   },
    -- }

    return {
      options = {
        component_separators = { left = " ", right = " " },
        theme = {
          normal = {
            a = { fg = colors.blue, bg = colors.none },
            b = { fg = colors.cyan, bg = colors.none },
            c = { fg = colors.fg, bg = colors.none },
            x = { fg = colors.fg, bg = colors.none },
            y = { fg = colors.magenta, bg = colors.none },
            z = { fg = colors.grey, bg = colors.none },
          },
          insert = {
            a = { fg = colors.green, bg = colors.none },
            z = { fg = colors.grey, bg = colors.none },
          },
          visual = {
            a = { fg = colors.magenta, bg = colors.none },
            z = { fg = colors.grey, bg = colors.none },
          },
          terminal = {
            a = { fg = colors.orange, bg = colors.none },
            z = { fg = colors.grey, bg = colors.none },
          },
        },

        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha" } },
      },
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { { "branch", icon = "" } },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󰝶 ",
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          {
            "filename",
            symbols = { modified = "  ", readonly = "", unnamed = "" },
          },
          {
            function()
              return require("nvim-navic").get_location()
            end,
            cond = function()
              return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
            end,
            color = { fg = colors.grey, bg = colors.none },
          },
        },
        lualine_x = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = colors.green },
          },
          -- {
          --   function()
          --     local icon = " "
          --     local status = require("copilot.api").status.data
          --     return icon .. (status.message or "")
          --   end,
          --   cond = function()
          --     local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
          --     return ok and #clients > 0
          --   end,
          --   color = function()
          --     if not package.loaded["copilot"] then
          --       return
          --     end
          --     local status = require("copilot.api").status.data
          --     return copilot_colors[status.status] or copilot_colors[""]
          --   end,
          -- },
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
            color = { fg = colors.green, bg = colors.none },
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
