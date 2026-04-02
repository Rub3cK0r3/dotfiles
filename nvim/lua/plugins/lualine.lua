return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
    require("lualine").setup({
        options = {
          theme = "dracula",
          component_separators = "󱑼",
          globalstatus = true,
        }
    })
    end,
  },
}
