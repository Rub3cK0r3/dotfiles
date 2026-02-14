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
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })
  end
})

