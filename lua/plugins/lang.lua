return {
  {
    "mrcjkb/rustaceanvim",
    version = "^3", -- Recommended
    ft = { "rust" },
  },
  {
    'Civitasv/cmake-tools.nvim',
    ft = { 'cpp' },
    opts = {
      cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
      -- support macro expansion:
      --       ${kit}
      --       ${kitGenerator}
      --       ${variant:xx}
      cmake_build_directory = 'build/${variant:buildType}', -- this is used to specify generate directory for cmake, allows macro expansion, relative to vim.loop.cwd()
      cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
      cmake_dap_configuration = { -- debug settings for cmake
        name = 'cpp',
        type = 'codelldb',
        request = 'launch',
        stopOnEntry = false,
        runInTerminal = true,
        console = 'integratedTerminal',
      },
      cmake_executor = { -- executor to use
        name = 'quickfix', -- name of the executor
        opts = {}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
        default_opts = { -- a list of default and possible values for executors
          quickfix = {
            show = 'always', -- "always", "only_on_error"
            position = 'belowright', -- "bottom", "top"
            size = 13,
            encoding = 'utf-8',
            auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
          },
          terminal = {
            name = 'Main Terminal',
            prefix_name = '[CMakeTools]: ', -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
            split_direction = 'vertical', -- "horizontal", "vertical"
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
        name = 'terminal', -- name of the runner
        opts = {}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
        default_opts = { -- a list of default and possible values for runners
          terminal = {
            name = 'Main Terminal',
            prefix_name = '[CMakeTools]: ', -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
            split_direction = 'vertical', -- "horizontal", "vertical"
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
        spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }, -- icons used for progress display
        refresh_rate_ms = 100, -- how often to iterate icons
      },
    },
    keys = {
      { '<leader>cc', '<cmd>CMakeRun<cr>', mode = { 'n', 'o', 'x' }, desc = 'CMake Run' },
      { '<leader>ct', '<cmd>CMakeSelectBuildType<cr>', mode = { 'n', 'o', 'x' }, desc = 'CMake Select Build Type' },
      { '<leader>cg', '<cmd>CMakeGenerate<cr>', mode = { 'n', 'o', 'x' }, desc = 'CMake Generate' },
      { '<leader>cb', '<cmd>CMakeBuild<cr>', mode = { 'n', 'o', 'x' }, desc = 'CMake Build' },
      { '<leader>cD', '<cmd>CMakeDebug<cr>', mode = { 'n', 'o', 'x' }, desc = 'CMake Debug' },
      { '<leader>ci', '<cmd>CMakeInstall<cr>', mode = { 'n', 'o', 'x' }, desc = 'CMake Install' },
    },
  },
}
