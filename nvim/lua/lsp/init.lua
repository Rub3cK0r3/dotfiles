-- lsp main config file
--
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = require("lsp.lsp_servers").servers

for name, cfg in pairs(servers) do
    vim.api.nvim_create_autocmd("FileType", {
        pattern = cfg.filetypes or {name},
        callback = function()
            if not vim.lsp.get_active_clients({ name = name })[1] then
                vim.lsp.start(vim.tbl_deep_extend("force", {
                    name = name,
                    capabilities = capabilities,
                }, cfg))
            end
        end,
        desc = "Lazy-load LSP: " .. name,
    })
end

require("lsp.jdtls")
