return {

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    lazy = false,
    opts = {
      shortcuts = {
        {
          name = "refactor",
          description = "Refactor code with best practices",
          details =
          "Automatically refactor code to improve readability, maintainability, and follow best practices while preserving functionality",
          prompt =
          "Please refactor this code following best practices, improving readability and maintainability while preserving functionality."
        },
        {
          name = "test",
          description = "Generate unit tests",
          details = "Create comprehensive unit tests covering edge cases, error scenarios, and various input conditions",
          prompt = "Please generate comprehensive unit tests for this code, covering edge cases and error scenarios."
        },
        -- Add more custom shortcuts...
      },
      -- add any opts here
      -- for example
      provider = vim.env.COPILOT == "true" and "copilot" or "claude",

      -- suggestion = {
      --   debounce = 100,
      --   throttle = 100,
      -- },
      -- mode = "mode",
      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
        minimize_diff = true,                  -- Whether to remove unchanged lines when applying a code block
        enable_token_counting = true,          -- Whether to enable token counting. Default to true.
        auto_approve_tool_permissions = false, -- D
      },
      auto_suggestions_provider = vim.env.COPILOT == "true" and "copilot" or "claude",

      providers = {
        -- ollama = {
        --   endpoint = "http://localhost:11434",
        --   model = "qwq:32b",
        -- },
        --

        copilot = {
          model = "gpt-5-mini",
          -- disable_tools = true,
        },

        openai = {
          model = "gpt-5",                        -- Or your desired OpenAI model (e.g., "gpt-3.5-turbo")
          endpoint = "https://api.openai.com/v1", -- OpenAI API endpoint
          timeout = 30000,                        -- Timeout in milliseconds
          disable_tools = true,
          -- extra_request_body = {
          --   temperature = 0.75,
          --   max_tokens = 20480,
          -- },
        },
        moonshot = {
          endpoint = "https://api.moonshot.ai/v1",
          model = "kimi-k2-0711-preview",
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 32768,
          },
        },
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-sonnet-4-20250514",
          timeout = 30000, -- Timeout in milliseconds
          disable_tools = true,
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
      },
      -- vendors = {
      --   ollama = {
      --     __inherited_from = "openai",
      --     api_key_name = "",
      --     endpoint = "http://127.0.0.1:11434/v1",
      --     model = "qwen2.5",
      --     max_tokens = 4097,
      --     -- important to set this to true if you are using a local server
      --     disable_tools = true,
      --   },
      -- },
      -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
      -- build = "make",
      build = vim.fn.has("win32") ~= 0
          and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      -- selector = {
      --   --- @alias avante.SelectorProvider "native" | "fzf_lua" | "mini_pick" | "snacks" | "telescope" | fun(selector: avante.ui.Selector): nil
      --   --- @type avante.SelectorProvider
      --   default = {
      --     "avante_commands",
      --     "avante_mentions",
      --     "avante_shortcuts",
      --     "avante_files",
      --   },
      --   provider = "fzf",
      --   providers = {
      --     avante_commands = {
      --       name = "avante_commands",
      --       module = "blink.compat.source",
      --       score_offset = 90, -- show at a higher priority than lsp
      --       opts = {},
      --     },
      --     avante_files = {
      --       name = "avante_files",
      --       module = "blink.compat.source",
      --       score_offset = 100, -- show at a higher priority than lsp
      --       opts = {},
      --     },
      --     avante_mentions = {
      --       name = "avante_mentions",
      --       module = "blink.compat.source",
      --       score_offset = 1000, -- show at a higher priority than lsp
      --       opts = {},
      --     },
      --     avante_shortcuts = {
      --       name = "avante_shortcuts",
      --       module = "blink.compat.source",
      --       score_offset = 1000, -- show at a higher priority than lsp
      --       opts = {},
      --     }
      --   },
      --   -- Options override for custom providers
      --   provider_opts = {},
      -- }
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick",                                       -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim",                               -- for file_selector provider telescope
      "hrsh7th/nvim-cmp",                                            -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua",                                            -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons",                                 -- or echasnovski/mini.icons
      vim.env.COPILOT == "true" and "zbirenbaum/copilot.lua" or nil, -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    }
  },
}
