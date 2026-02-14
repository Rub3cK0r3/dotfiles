-- lsp main config file
--
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = require("lsp.lsp_servers").servers

for name, cfg in pairs(servers) do
  local filetypes = cfg.filetypes or {name}

  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function()
      if not lspconfig[name].manager.active then
        lspconfig[name].setup(vim.tbl_deep_extend("force", {
          capabilities = capabilities,
        }, cfg))
      end
    end,
    desc = "Lazy-load LSP: " .. name,
  })
end

require("lsp.jdtls")
