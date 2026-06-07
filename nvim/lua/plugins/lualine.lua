return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
    require("lualine").setup({
        options = {
          theme = "powerline_dark",
          component_separators = "󱑼",
          globalstatus = true,
        }
    })
    end,
  },
}
