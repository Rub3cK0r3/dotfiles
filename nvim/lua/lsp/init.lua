-- lsp main config file
--
local capabilities = require("cmp_nvim_lsp").default_capabilities() 

local servers = {
  lua_ls = {},
  ts_ls = {},
  pyright = {},
  bashls = {},
  html = {},
  cssls = {},
  jsonls = {},
  yamlls = {},
  dockerls = {},
  docker_compose_language_service = {},
  clangd = {},
  rust_analyzer = {},
  gopls = {},
  jdtls = {},
  intelephense = {},
  sqlls = {},
}

for name, cfg in pairs(servers) do
  vim.lsp.config(name, vim.tbl_deep_extend("force", {
    capabilities = capabilities,
  }, cfg))

  vim.lsp.enable(name)
end

-- Java-specific config 
require("lsp.jdtls")
