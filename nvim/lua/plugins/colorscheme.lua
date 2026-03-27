return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      require("kanagawa").setup({
        compile = true,
        theme = "wave",
        background = "hard",
        dimInactive = false,
        colors = { theme = { background = "#010101" } },
      })
      vim.cmd([[colorscheme kanagawa]])
    end,
  },
}
