return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = { enabled = false },
      bigfile = { enabled = true },
      quickfile = { enabled = true },
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

}
