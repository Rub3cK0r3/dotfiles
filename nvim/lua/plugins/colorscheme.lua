return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        terminal_colors = true,
        on_highlights = function(highlights, colors)
          highlights.AlphaHeader = { fg = colors.purple }
        end,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
      vim.o.background = "dark"
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
