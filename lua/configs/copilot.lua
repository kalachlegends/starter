return   {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',

    -- opts = {
    --   panel = {
    --     enabled = false,
    --   },
    --   suggestion = {
    --     auto_trigger = true,
    --     hide_during_completion = false,
    --     keymap = {
    --       accept = '<Tab>',
    --     },
    --   },
    --
    -- },
    config = function()
      require("copilot").setup({
        panel = {
          enabled = false,
        },
        suggestion = {
          enabled = false,
          auto_trigger = true,
          hide_during_completion = false,
          keymap = {
            accept = '<Tab>',
          },
        },
      })
      vim.api.nvim_create_autocmd("User", {
        pattern = "BlinkCmpMenuOpen",
        callback = function()
          vim.b.copilot_suggestion_hidden = true
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "BlinkCmpMenuClose",
        callback = function()
          vim.b.copilot_suggestion_hidden = false
        end,
      })
    end,
  }
