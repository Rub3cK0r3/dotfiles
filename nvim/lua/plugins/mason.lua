return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
            "bashls",
            "clangd",
            "cssls",
            "dockerls",
            "gopls",
            "html",
            "intelephense",
            "jdtls",
            "jsonls",
            "lua_ls",
            "pyright",
            "rust_analyzer",
            "sqlls",
            "yamlls",
        },
        automatic_installation = true,
      })
    end,
  },
}
