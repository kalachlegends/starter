-- load defaults i.e lua_lsp
require("configs.lspconfigs").defaults()

local servers = {
  html = {},
  awk_ls = {},
  bashls = {},
  prettier = {
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro", "htmlangular" }
  },
  eslint = {},
  ts_ls = {
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro", "htmlangular" }
  },
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end

local null_ls = require("null-ls")

-- require("lspconfig").ts_ls.setup({
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- })

-- require("lspconfig").ts_ls.setup({
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- })

null_ls.setup({
})


-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--  if is_excluded_project() then
-- │     -- Use elixirls for excluded projects
-- │     lspconfig.elixirls.setup {
-- │       on_attach = nvlsp.on_attach,
-- │       on_init = nvlsp.on_init,
-- │       capabilities = nvlsp.capabilities,
-- │       cmd = { "elixir-ls" },
-- │       filetypes = { "elixir", "eelixir", "heex", "surface" },
-- │       root_dir = lspconfig.util.root_pattern("mix.exs", ".git"),
-- │       settings = {
-- │         elixirLS = {
-- │           dialyzerEnabled = true,
-- │           fetchDeps = false,
-- │           enableTestLenses = false,
-- │           suggestSpecs = false,
-- │         },
-- │       },
-- │     }
-- │   else
-- │     -- Use nextls for regular projects
-- │     lspconfig.nextls.setup {
-- │       on_attach = nvlsp.on_attach,
-- │       on_init = nvlsp.on_init,
-- │       capabilities = nvlsp.capabilities,
-- │       cmd = { "nextls", "--stdio" },
-- │       filetypes = { "elixir", "eelixir", "heex", "surface" },
-- │       root_dir = lspconfig.util.root_pattern("mix.exs", ".git"),
-- │       init_options = {
-- │         experimental = {
-- │           completions = {
-- │             enable = true,
-- │           },
-- │         },
-- │       },
-- │     }
-- ╰─  end
