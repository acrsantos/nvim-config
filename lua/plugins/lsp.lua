return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
    },
  },

  -- Language Server
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clang-format",
        "clangd",
        "codelldb",
        "eslint-lsp",
        "json-lsp",
        "lua-language-server",
        "rust-analyzer",
        "shfmt",
        "stylua",
        "tailwindcss-language-server",
        "typescript-language-server",
      },
    },
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "html",
        "javascript",
        "json",
        "json5",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      -- highlight = {
      --   enable = false,
      --   disable = function(lang, buf)
      --     local max_filesize = 100 * 1024 -- 100 KB
      --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      --     if ok and stats and stats.size > max_filesize then
      --       return true
      --     end
      --   end,
      --   additional_vim_regex_highlighting = true,
      -- },
    },
  },
  -- Language Specific Tools
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^3", -- Recommended
    ft = { "rust" },
  },
  {
    "Civitasv/cmake-tools.nvim",
    ft = { "cpp" },
    config = function()
      require("cmake-tools").setup({
        cmake_command = "cmake", -- this is used to specify cmake command path
        ctest_command = "ctest", -- this is used to specify ctest command path
        cmake_regenerate_on_save = true, -- auto generate when save CMakeLists.txt
        cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
        cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
        -- support macro expansion:
        --       ${kit}
        --       ${kitGenerator}
        --       ${variant:xx}
        cmake_build_directory = "build/${variant:buildType}", -- this is used to specify generate directory for cmake, allows macro expansion, relative to vim.loop.cwd()
        cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
        cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
        cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
        cmake_variants_message = {
          short = { show = true }, -- whether to show short message
          long = { show = true, max_length = 40 }, -- whether to show long message
        },
        cmake_dap_configuration = { -- debug settings for cmake
          name = "cpp",
          type = "codelldb",
          request = "launch",
          stopOnEntry = false,
          runInTerminal = true,
          console = "integratedTerminal",
        },
        cmake_executor = { -- executor to use
          name = "terminal", -- name of the executor
          opts = {}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
          default_opts = { -- a list of default and possible values for executors
            quickfix = {
              show = "always", -- "always", "only_on_error"
              position = "belowright", -- "vertical", "horizontal", "leftabove", "aboveleft", "rightbelow", "belowright", "topleft", "botright", use `:h vertical` for example to see help on them
              size = 10,
              encoding = "utf-8", -- if encoding is not "utf-8", it will be converted to "utf-8" using `vim.fn.iconv`
              auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
            },
            overseer = {
              new_task_opts = {
                Strategy = {
                  "toggleterm",
                  direction = "vertical",
                  autos_croll = true,
                  quit_on_exit = "false",
                },
              }, -- options to pass into the `overseer.new_task` command
              on_new_task = function(task)
                require("overseer").open({ enter = false, direction = "left" })
              end, -- a function that gets overseer.Task when it is created, before calling `task:start`
            },
            terminal = {
              name = "Main Terminal",
              prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
              split_direction = "vertical", -- "horizontal", "vertical"
              split_size = 75,

              -- Window handling
              single_terminal_per_instance = true, -- Single viewport, multiple windows
              single_terminal_per_tab = true, -- Single viewport per tab
              keep_terminal_static_location = true, -- Static location of the viewport if avialable

              -- Running Tasks
              start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
              focus = true, -- Focus on terminal when cmake task is launched.
              do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
            }, -- terminal executor uses the values in cmake_terminal
          },
        },
        cmake_runner = { -- runner to use
          name = "terminal", -- name of the runner
          opts = {}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
          default_opts = { -- a list of default and possible values for runners
            quickfix = {
              show = "always", -- "always", "only_on_error"
              position = "belowright", -- "bottom", "top"
              size = 10,
              encoding = "utf-8",
              auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
            },
            overseer = {
              new_task_opts = {
                Strategy = {
                  "toggleterm",
                  direction = "tab",
                  autos_croll = true,
                  quit_on_exit = "success",
                },
              }, -- options to pass into the `overseer.new_task` command
              on_new_task = function(task) end, -- a function that gets overseer.Task when it is created, before calling `task:start`
            },
            terminal = {
              name = "Main Terminal",
              prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
              split_direction = "vertical", -- "horizontal", "vertical"
              split_size = 75,

              -- Window handling
              single_terminal_per_instance = true, -- Single viewport, multiple windows
              single_terminal_per_tab = true, -- Single viewport per tab
              keep_terminal_static_location = true, -- Static location of the viewport if avialable

              -- Running Tasks
              start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
              focus = true, -- Focus on terminal when cmake task is launched.
              do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
            },
          },
        },
        cmake_notifications = {
          runner = { enabled = true },
          executor = { enabled = true },
          spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
          refresh_rate_ms = 100, -- how often to iterate icons
        },
      })
    end,
  },
  -- {
  --   "stevearc/overseer.nvim",
  --   -- config = function()
  --   --   require("overseer").setup()
  --   -- end,
  --   opts = {
  --     form = {
  --       win_opts = {
  --         winblend = 0,
  --         -- winhighlight = "NormalFloat:MyCustomHighlight",
  --       },
  --     },
  --     confirm = {
  --       win_opts = {
  --         winblend = 0,
  --         -- winhighlight = "NormalFloat:MyCustomHighlight",
  --       },
  --     },
  --     task_win = {
  --       win_opts = {
  --         winblend = 0,
  --         -- winhighlight = "NormalFloat:MyCustomHighlight",
  --       },
  --     },
  --   },
  -- },
}
