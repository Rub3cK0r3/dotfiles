return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          theme = "powerline_dark",
          icons_enabled = true,
          component_separators = { left = "│", right = "│" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
          refresh = { statusline = 500 },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { { "branch", icon = "" }, "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = {
            {
              function()
                local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
                if #buf_clients == 0 then
                  return "LSP OFF"
                end

                local names = {}
                for _, client in ipairs(buf_clients) do
                  table.insert(names, client.name)
                end
                table.sort(names)
                return table.concat(names, ", ")
              end,
              icon = "󰒋",
            },
            "encoding",
            "fileformat",
            "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}
