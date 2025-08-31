return {
    "format_current_lines", -- Имя плагина (может быть любое)
    lazy = false,
    dir = vim.fn.stdpath "config" .. "/lua/custom-plugins/format_current_lines_ex/",
    config = function()
      local replace_with_execute = require "custom-plugins.format_current_lines_ex"

      vim.api.nvim_create_user_command(
        "ReplaceWithExecute",
        function() replace_with_execute.replace_selection_with_execute() end,
        { range = true, nargs = 0, bang = false }
      )

      vim.api.nvim_set_keymap("v", "<leader>mf", ":ReplaceWithExecute<CR>", { noremap = true, silent = true })
    end,
  }
