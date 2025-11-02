return {
  (vim.env.SQLUA == "true" and { import = "configs.sqllua" } or {}),
  { import = "configs.dap" },
  { import = "configs.nvim-ufo" },
  { import = "configs.auto-save" },
  { import = "configs.grug-far" },
  { import = "configs.nvim-tree" },
  { import = "configs.blink_cmp" },
  { import = "configs.flutter_spec" },
  { import = "configs.tree-sitter" },
  { import = "configs.git-signs" },
  { import = "configs.elixir" },
  { import = "configs.avante" },
  (vim.env.COPILOT == "true" and { import = "configs.copilot" } or {}),
  { import = "configs.lazygit" },
  { import = "configs.nvim-scissors" },
  { import = "configs.remote-nvim" },
  { import = "configs.surround" },
  { import = "configs.vim-move" },
  -- { import = "configs.swear-cursor" },
  { import = "configs.hop" },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      -- add options here
      -- or leave it empty to use the default settings
    },
    keys = {
      -- suggested keymap
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
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
      vim.g.VM_theme = "purplegray"
      vim.g.VM_mouse_mappings = 1
      -- vim.schedule(function()
      vim.g.VM_maps = {

        ['Find Under']         = '<C-n>',
        ['Find Subword Under'] = '<C-n>',
        ["I BS"] = "",
        ["Goto Next"] = "]v",
        ["Goto Prev"] = "[v",
        ["I CtrlB"] = "<M-b>",
        ["I CtrlF"] = "<M-f>",
        ["I Return"] = "<S-CR>",
        ["I Down Arrow"] = "",
        ["I Up Arrow"] = "",
      }
    end
  },
  {
    "mcauley-penney/tidy.nvim",
    lazy = false,
    config = true,
  },


  (vim.env.PLUGIN_EVAL == "true" and { import = "configs.format_current_lines" } or {}),

  (vim.env.PLUGIN_EVAL == "true" and { import = "configs.eval-plugin" } or {}),

  -- "NvChad/nvcommunity",
  -- { import = "nvcommunity.folds.ufo" },

}
