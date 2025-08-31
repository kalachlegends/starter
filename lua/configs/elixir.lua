 return {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup {
        nextls = {enable = true},
        elixirls = {
          enable = function()
            local bufname = vim.api.nvim_buf_get_name(0)
            -- List of folders to disable elixirls for
            local disabled_folders = { "deps", "_build", ".elixir_ls", "ms_pp" }

            for _, folder in ipairs(disabled_folders) do
              if bufname:match(folder) then
                return false
              end
            end

            return true
          end,
          settings = elixirls.settings {
            dialyzerEnabled = true,
            enableTestLenses = false,
          },
          on_attach = function(client, bufnr)
            vim.keymap.set("n", "<leader>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("n", "<leader>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("v", "<leader>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          end,
        },
        projectionist = {
          enable = true
        }
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  }
