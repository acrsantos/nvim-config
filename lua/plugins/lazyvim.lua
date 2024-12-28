return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = { enabled = false },
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      indent = { enabled = false },
      terminal = { enabled = false },
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
        menu = { border = "single" },
        documentation = { window = { border = 'single' } },
        list = { selection = "manual" },
      },
      signature = {
        enabled = true,
        window = { border = 'single' }
      }
    },
  },
}
