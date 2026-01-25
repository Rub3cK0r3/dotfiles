-- Check if the buffer is empty or contains only whitespace
local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
local is_empty = true
for _, line in ipairs(lines) do
    if vim.fn.trim(line) ~= "" then
        is_empty = false
        break
    end
end

if not is_empty then
    -- Start or attach to jdtls
    jdtls.start_or_attach({
        cmd = { "jdtls" },
        root_dir = root_dir,
        workspace_dir = workspace_dir,
        settings = {
            java = {
                eclipse = { downloadSources = true },
                referencesCodeLens = { enabled = true },
                implementationsCodeLens = { enabled = true },
            }
        },
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })
end

