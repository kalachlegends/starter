-- load defaults i.e lua_lsp
require("configs.lspconfigs").defaults()

-- local lspconfig = require "configs.lspconfigs"

local servers = { "html", "cssls", "vtsls" }
vim.lsp.enable(servers)
-- -- lsps with default config
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities,
--   }
-- end

local null_ls = require("null-ls")

null_ls.setup({
})

-- configuring single server, example: typescript
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
