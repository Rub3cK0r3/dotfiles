return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
    require("lualine").setup({
        options = {
          theme = "ayu_dark",
          component_separators = "󱑼",
          globalstatus = true,
        }
    })
    end,
  },
}
