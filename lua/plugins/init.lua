return {
  { import = "configs.nvim-tree" },
  { import = "nvchad.blink.lazyspec" },
  { import = "configs.flutter_spec" },
  { import = "configs.tree-sitter" },
  { import = "configs.git-signs" },
  { import = "configs.elixir" },
  { import = "configs.avante" },
  { import = "configs.lazygit" },
  { import = "configs.format_current_lines" },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
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
    dir = vim.fn.stdpath "config" .. "/lua/custom-plugins/nvim-code-eval-plugin/",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("configs.eval-plugin").config_setup()
    end,
  },


}
