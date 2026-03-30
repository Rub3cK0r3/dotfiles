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
              b = { fg = "#7fbf7f", bg = "#010101", gui = "bold" },
              c = { fg = "#7fbf7f", bg = "#010101", gui = "bold" },
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

          section_separators = "  ",
          component_separators = "󱑼",
          globalstatus = true,
        },

        sections = {
          lualine_a = {"mode"},
          lualine_b = {"filename",{
              "filetype"
            }
          },
          lualine_c = {"encoding"},
          lualine_x = {"diagnostics"},
          lualine_y = {},
          lualine_z = {{"datetime", style = 'default'},"location"},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      })
    end,
  },
}
