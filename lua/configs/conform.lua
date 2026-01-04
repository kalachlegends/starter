local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    sh = { "shfmt" },
    go = { "gofmt" },
    javascriptreact = { "prettier" },  -- JSX
    typescriptreact = { "prettier" },  -- TSX
  },

  format_on_save = {
    timeout_ms = 3000,
    lsp_fallback = true,
  },
})
