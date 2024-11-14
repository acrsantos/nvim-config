return {
  -- {
  --   "rcarriga/nvim-notify",
  --   enabled = false,
  --   opts = {
  --     background_colour = "#000000",
  --   },
  -- },
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   enabled = true,
  -- },
  {
    "folke/noice.nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
  {
    "echasnovski/mini.indentscope",
    enabled = false,
  },
  {
    "catppuccin/nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    enabled = false,
    opts = function()
      -- don't use animate when scrolling with the mouse
      local mouse_scrolled = false
      for _, scroll in ipairs({ "Up", "Down" }) do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require("mini.animate")
      return {
        resize = {
          timing = animate.gen_timing.linear({ duration = 10, unit = "total" }),
        },
        scroll = {
          timing = animate.gen_timing.linear({ duration = 10, unit = "total" }),
          subscroll = animate.gen_subscroll.equal({
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          }),
        },
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
}
