return {
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    opts = {


       ui = {
    -- the border type to use for all floating windows, the same options/formats
    -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
    border = "rounded",
    -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
    -- please note that this option is eventually going to be deprecated and users will need to
    -- depend on plugins like `nvim-notify` instead.
    notification_style = 'plugin'
  },

        debugger = { -- integrate with nvim dap + install dart code debugger
    enabled = true,
    -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
    -- see |:help dap.set_exception_breakpoints()| for more info
    exception_breakpoints = {},
    -- Whether to call toString() on objects in debug views like hovers and the
    -- variables list.
    -- Invoking toString() has a performance cost and may introduce side-effects,
    -- although users may expected this functionality. null is treated like false.
    evaluate_to_string_in_debug_views = true,
    -- You can use the `debugger.register_configurations` to register custom runner configuration (for example for different targets or flavor). Plugin automatically registers the default configuration, but you can override it or add new ones.
    -- register_configurations = function(paths)
    --   require("dap").configurations.dart = {
    --     -- your custom configuration
    --   }
    -- end,
  },
    }
},
{
  'wa11breaker/flutter-bloc.nvim',
  dependencies = {
      "nvimtools/none-ls.nvim", -- Required for code actions
  },
  event = "BufRead *.dart",
  opts = {
    bloc_type = 'default', -- Choose from: 'default', 'equatable', 'freezed'
    use_sealed_classes = false,
    enable_code_actions = true,
  }
},
  {
    'wa11breaker/dart-data-class-generator.nvim',
    dependencies = {
        "nvimtools/none-ls.nvim", -- Required for code actions
    },
    event = "BufRead *.dart",

    ft = 'dart',
    config = function()
        require("dart-data-class-generator").setup({})
    end
}
}
