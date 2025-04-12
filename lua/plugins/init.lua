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
      sync_install = false,

      auto_install = true,

      ignore_install = { "javascript" },


      highlight = {
        enable = true,

      },
    },
  },
}
