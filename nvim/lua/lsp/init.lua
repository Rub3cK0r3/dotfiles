local M = {}
-- This defines how i want my diagnostic
-- to be shown in the terminal
vim.diagnostic.config({
  severity_sort = true,
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 2, prefix = "●" },
  float = { border = "rounded", source = "if_many" },
})

-- LSP configs for cmp_lsp and capabilities configs prepared
-- for a long time 
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
  capabilities = cmp_lsp.default_capabilities(capabilities)
end

-- definition of the LSP servers i use on a daily basis
local servers = {
  bashls = require("lsp.lsp-languages.bashls"),
  clangd = require("lsp.lsp-languages.clangd"),
  cssls = require("lsp.lsp-languages.cssls"),
  dockerls = require("lsp.lsp-languages.dockerls"),
  docker_compose_language_service = require("lsp.lsp-languages.docker_compose_language_service"),
  gopls = require("lsp.lsp-languages.gopls"),
  html = require("lsp.lsp-languages.html"),
  intelephense = require("lsp.lsp-languages.intelephense"),
  jdtls = require("lsp.lsp-languages.jdtls"),
  jsonls = require("lsp.lsp-languages.jsonls"),
  lua_ls = require("lsp.lsp-languages.lua_ls"),
  pyright = require("lsp.lsp-languages.pyright"),
  rust_analyzer = require("lsp.lsp-languages.rust_analyzer"),
  sqlls = require("lsp.lsp-languages.sqlls"),
  yamlls = require("lsp.lsp-languages.yamlls"),
}

-- After installing them i have configure them and launch them, so to speak..
for name, cfg in pairs(servers) do
  local merged = vim.tbl_deep_extend("force", {}, cfg or {})
  merged.capabilities = vim.tbl_deep_extend("force", {}, capabilities, merged.capabilities or {})
  vim.lsp.config(name, merged)
  vim.lsp.enable(name)
end

-- If i want to install other LSP servers I'd have to use Mason
-- this is what rub3ck0r3 uses and the code above is for managing
-- its behaviour
vim.api.nvim_create_user_command("LspInstallServers", function()
  local ok_registry, registry = pcall(require, "mason-registry")
  if not ok_registry then
    return vim.notify("mason.nvim no está disponible", vim.log.levels.WARN)
  end

  local wanted = vim.tbl_keys(servers)
  table.sort(wanted)

  local any = false
  for _, name in ipairs(wanted) do
    local ok_pkg, pkg = pcall(registry.get_package, name)
    if ok_pkg and pkg and not pkg:is_installed() then
      any = true
      pkg:install()
    end
  end

  if not any then
    vim.notify("Todos los servidores LSP ya están instalados", vim.log.levels.INFO)
  else
    vim.notify("Instalando servidores LSP configurados vía Mason…", vim.log.levels.INFO)
  end
end, { desc = "Instalar servidores LSP configurados (Mason)" })

return M
