-- lua/lsp/init.lua
--
-- Central LSP setup, lazy-loaded per filetype
--

local lspconfig = require("lspconfig")
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  lua_ls      = { filetypes = {"lua"} },
  pyright     = { filetypes = {"python"} },
  tsserver    = { filetypes = {"typescript","typescriptreact","javascript","javascriptreact"} },
  bashls      = { filetypes = {"sh","bash"} },
  html        = { filetypes = {"html"} },
  cssls       = { filetypes = {"css","scss","less"} },
  jsonls      = { filetypes = {"json"} },
  clangd      = { filetypes = {"c","cpp","objc","objcpp"} },
  rust_analyzer = { filetypes = {"rust"} },
  gopls       = { filetypes = {"go"} },
  intelephense = { filetypes = {"php"} },
}

local custom_cfg = {
  rust_analyzer = {
    settings = { ["rust-analyzer"] = { cargo = { allFeatures = true }, checkOnSave = { command = "clippy" } } }
  },
}

for name, cfg in pairs(servers) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = cfg.filetypes,
    callback = function()
      for _, c in pairs(vim.lsp.get_active_clients()) do
        if c.name == name then return end
      end

      local setup_cfg = vim.tbl_deep_extend("force", { capabilities = cmp_capabilities }, custom_cfg[name] or {})
      lspconfig[name].setup(setup_cfg)
    end,
  })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    local jdtls = require("jdtls")
    local jdtls_bin = vim.fn.expand("~/.local/share/jdtls/bin/jdtls")

    local root_dir = require('jdtls.setup').find_root({
      '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle', 'build.gradle.kts'
    })

    local workspace_dir = vim.fn.expand("~/.cache/nvim/jdtls/workspace") .. "/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

    jdtls.start_or_attach({
      cmd = { jdtls_bin, "-data", workspace_dir },
      root_dir = root_dir,
      settings = {
        java = {
          eclipse = { downloadSources = true },
          referencesCodeLens = { enabled = true },
          implementationsCodeLens = { enabled = true },
        }
      },
      capabilities = cmp_capabilities,
    })
  end,
})

