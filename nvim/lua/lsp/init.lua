-- lsp main config file
--

-- suppress warnings temporarily
-- for deprecated warnings about lspconfig
local old_notify = vim.notify
vim.notify = function() end  -- silence

local lspconfig = require("lspconfig") 
local capabilities = require("cmp_nvim_lsp").default_capabilities() 

local servers = { 
    "lua_ls", "ts_ls", "pyright", "bashls", 
    "html", "cssls", "jsonls", "yamlls", 
    "dockerls", "docker_compose_language_service", 
    "clangd", "rust_analyzer", "gopls", "jdtls", 
    "intelephense", "sqlls" 
}

for _, server in ipairs(servers) do 
    local config = vim.tbl_deep_extend("force", { capabilities = capabilities, }, 
    lspconfig[server] and lspconfig[server].document_config or {}
) 

vim.lsp.start_client(config) end 

-- Java-specific config 
require("lsp.jdtls")


-- restore notify function
vim.notify = old_notify
