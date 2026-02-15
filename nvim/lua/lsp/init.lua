-- lsp main config file
--
local capabilities = require("cmp_nvim_lsp").default_capabilities() 

local servers = require('lsp.lsp_servers')

for name, cfg in pairs(servers) do
  vim.lsp.config(name, vim.tbl_deep_extend("force", {
    capabilities = capabilities,
  }, cfg))

  vim.lsp.enable(name)
end

-- Java-specific config 
require("lsp.jdtls")
