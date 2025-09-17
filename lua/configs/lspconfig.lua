-- load defaults i.e lua_lsp
require("configs.lspconfigs").defaults()

local lspconfig = require "configs.lspconfigs"

-- EXAMPLE
local servers = {
  lua = {},
  html = {},
  cssls = {},
  elixirls = {},
  dart = {},

  nextls = {

  }
}
local nvlsp = require "configs.lspconfigs"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
