return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          theme = {
            normal = {
              a = { fg = "#010101", bg = "#7fbf7f", gui = "bold" },
              b = { fg = "#c5d1c5", bg = "#010101" },
              c = { fg = "#c5d1c5", bg = "#010101" },
              x = { fg = "#e0af68", bg = "#010101" },
              y = { fg = "#c5d1c5", bg = "#010101" },
              z = { fg = "#6fb3a2", bg = "#010101", gui = "bold" },
            },
            inactive = {
              a = { fg = "#c5d1c5", bg = "#010101" },
              b = { fg = "#c5d1c5", bg = "#010101" },
              c = { fg = "#c5d1c5", bg = "#010101" },
              x = { fg = "#c5d1c5", bg = "#010101" },
              y = { fg = "#c5d1c5", bg = "#010101" },
              z = { fg = "#c5d1c5", bg = "#010101" },
            },
          },
          section_separators = "",
          component_separators = "",
          globalstatus = true,
        },
        sections = {
          lualine_a = {"mode"},
          lualine_b = {},
          lualine_c = {"filename"},
          lualine_x = {"diagnostics"},
          lualine_y = {},
          lualine_z = {"location"},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {"filename"},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {"location"},
        },
      })
    end,
  },
}
