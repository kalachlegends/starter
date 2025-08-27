return {
  "chrisgrieser/nvim-scissors",
  lazy = false,
  dependencies = "nvim-telescope/telescope.nvim", -- if using telescope

  opts = {
    snippetDir = vim.fn.stdpath "config" .. "/snippets",

  },
  config = function()
    require("scissors").setup {
      snippetDir = vim.fn.stdpath("config") .. "/snippets" }


    vim.keymap.set(
      "n",
      "<leader>se",
      function() require("scissors").editSnippet() end,
      { desc = "Snippet: Edit" }
    )

    -- when used in visual mode, prefills the selection as snippet body
    vim.keymap.set(
      { "v", "n" },
      "<leader>sa",
      function() require("scissors").addNewSnippet() end,
      { desc = "Snippet: Add" }
    )
  end

}
