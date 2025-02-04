return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = {
        enabled = true,
        sections = {
          -- { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          -- { section = "startup" },
        },
      },
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      indent = { enabled = false },
      terminal = {
        win = {
          wo = {
            winbar = "",
          },
        },
      },
      styles = {
        split = {
          height = 0.3,
          width = 0.4,
        },
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    lazy = true,
  },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        search = {
          enabled = false,
        },
        char = {
          enabled = false,
        },
      },
    },
  },
  {
    "stevearc/overseer.nvim",
    opts = {
      task_list = {
        direction = "left",
      },
    },
  },
  {
    "Saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          border = "single",
          auto_show = false,
        },
        documentation = { window = { border = "single" } },
        list = { selection = { preselect = false, auto_insert = true} },
      },
      signature = {
        enabled = true,
        window = { border = "single" },
      },
    },
  },
}
