return {
  {
    "j-hui/fidget.nvim",
    ft = { "rust", "lua" },
    config = function()
      require("fidget").setup({})
    end,
  },
  {
    "folke/noice.nvim",
    enabled = false,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },
  { "MunifTanjim/nui.nvim", enabled = true },
  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup({
        highlight_on_key = true, -- show highlights only after keypress
        dim = false, -- dim all other characters if set to true (recommended!)
      })
    end,
  },
  {
    "sindrets/diffview.nvim",
    lazy = true,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    -- enabled = false,
    opts = {
      window = {
        position = "left",
        width = 30,
      },
      filesystem = {
        hijack_netrw_behavior = "open_current", -- open_default
        filtered_items = {
          visible = true, -- Setting this to true will only dimmed out all supposed hidden items.
          hide_dotfiles = true,
          hide_gitignored = true,
        },
      },
    },
  },
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          enabled = false,
        },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    -- enabled = false,
  },
  {
    "chrisgrieser/nvim-spider",
    -- enabled = false,
    keys = {
      { -- example for lazy-loading on keystroke
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { "n", "o", "x" },
      },
      { -- example for lazy-loading on keystroke
        "w",
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { "n", "o", "x" },
      },
      { -- example for lazy-loading on keystroke
        "b",
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = { "n", "o", "x" },
      },
    },
    config = function()
      require("spider").setup({
        skipInsignificantPunctuation = false,
        subwordMovement = true,
      })
      vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
      vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
      vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
    end,
  },
}
