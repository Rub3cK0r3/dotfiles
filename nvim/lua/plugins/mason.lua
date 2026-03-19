return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      local ok, mason = pcall(require, "mason")
      if not ok then
        vim.notify("Error cargando mason.nvim", vim.log.levels.ERROR)
        return
      end

      mason.setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      local ok_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
      if ok_lsp then
        mason_lspconfig.setup({
          ensure_installed = {},
          automatic_installation = false,
        })
      end
    end,
  },
}
