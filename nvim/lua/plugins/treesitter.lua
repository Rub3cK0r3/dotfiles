return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      vim.schedule(function()
        local ok, ts = pcall(require, "nvim-treesitter.configs")
        if not ok then
          return
        end

        ts.setup({
          ensure_installed = {
            "bash","c","cpp","css","dockerfile","go","html","java",
            "javascript","json","lua","python","rust","sql","typescript","yaml",
          },
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
          indent = { enable = true },
          auto_install = true,
          ignore_install = {},
        })
      end)
    end,
  },
}

