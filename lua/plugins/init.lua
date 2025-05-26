return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

{
    "format_current_lines", -- Имя плагина (может быть любое)
    lazy = false,
    dir = "~/.config/nvim/lua/custom-plugins/format_current_lines_ex/",
    config = function()
      local replace_with_execute = require "custom-plugins.format_current_lines_ex"

      vim.api.nvim_create_user_command(
        "ReplaceWithExecute",
        function() replace_with_execute.replace_selection_with_execute() end,
        { range = true, nargs = 0, bang = false }
      )

      vim.api.nvim_set_keymap("v", "<leader>mf", ":ReplaceWithExecute<CR>", { noremap = true, silent = true })
    end,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
    branch = "master",
    init = function()
      vim.g.VM_maps = {
         ['Find Under']         = '<C-n>',
         ['Find Subword Under'] = '<C-n>',
      }
    end
  },
  {
      "mcauley-penney/tidy.nvim",
      lazy = false,
      config = true,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    dir = "/home/artem/.config/nvim/lua/custom-plugins/nvim-code-eval-plugin/",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("configs.eval-plugin").config_setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

          local keymap = vim.keymap.set
        -- remove default keymap example
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        keymap("n", "<BS>", api.tree.change_root_to_parent, opts "Change root to parent")
        keymap("n", ".", api.tree.change_root_to_node, opts "Change root to root")
        keymap("n", "l", api.node.open.edit, opts("Open"))
        keymap("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
      end,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",

    lazy = false,
    dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects"
  },
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "elixir",
      },
      textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer", -- 'around function'
          ["if"] = "@function.inner", -- 'inner function'
        },
      },
      },

      ignore_install = { },


      highlight = {
        enable = true,
      },
    },
  },
  {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    -- add any opts here
    -- for example
    provider = "claude",
    model = "claude_sonnet_4"
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
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
  },
}
  -- {
  --   "elixir-tools/elixir-tools.nvim",
  --   version = "*",
  --   lazy = false,
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     local elixir = require("elixir")
  --     local elixirls = require("elixir.elixirls")
  --
  --     elixir.setup {
  --       nextls = {enable = true},
  --       elixirls = {
  --         enable = true,
  --         settings = elixirls.settings {
  --           dialyzerEnabled = false,
  --           enableTestLenses = false,
  --         },
  --         on_attach = function(client, bufnr)
  --           vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
  --           vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
  --           vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
  --         end,
  --       },
  --       projectionist = {
  --         enable = true
  --       }
  --     }
  --   end,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  -- }
}
