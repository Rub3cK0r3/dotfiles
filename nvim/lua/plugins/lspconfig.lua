-- Minimal lspconfig for nvim
return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "williamboman/mason.nvim" },
  },
}
