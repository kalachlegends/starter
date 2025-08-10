return {
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
  },

  {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "InsertEnter", "CmdLineEnter" },

    dependencies = {
      'Kaiser-Yang/blink-cmp-avante',
      "rafamadriz/friendly-snippets",
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "nvchad.configs.luasnip"
        end,
      },

      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
      },
    },
    opts = {
      snippets = { preset = "luasnip" },
      cmdline = { enabled = true },
      appearance = { nerd_font_variant = "normal" },
      fuzzy = { implementation = "prefer_rust" },
      sources = {
        default = { "lsp", "snippets", "buffer", "path", "avante" },
        providers = {
          avante = {
            module = 'blink-cmp-avante',
            name = 'Avante',
            opts = {
              -- options for blink-cmp-avante
            }
          }
        }
      },

      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },

      completion = {
        -- ghost_text = { enabled = true },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = { border = "single" },
        },


        -- from nvchad/ui plugin
        -- exporting the ui config of nvchad blink menu
        -- helps non nvchad users
        menu = require("nvchad.blink").menu,
      },
    },
    opts_extend = { "sources.default" },

  },
}
