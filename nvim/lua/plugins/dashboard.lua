return {
  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local plugin_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h")
      local config_dir = vim.fn.fnamemodify(plugin_dir, ":h:h")
      local banner = vim.fn.readfile(config_dir .. "/lua/ui/banner.txt")

      while #banner > 0 and banner[#banner] == "" do
        table.remove(banner)
      end

      local source_width = 0
      for _, line in ipairs(banner) do
        source_width = math.max(source_width, vim.api.nvim_strwidth(line))
      end

      dashboard.section.header.val = function()
        local window_width = math.min(vim.o.columns, vim.api.nvim_win_get_width(0))
        local available_width = math.max(1, window_width - 4)
        local scale = math.min(1, available_width / source_width)
        if scale == 1 then
          return banner
        end

        local resized = {}
        for line_index, line in ipairs(banner) do
          local char_count = vim.fn.strchars(line)
          local target_count = math.max(1, math.floor(char_count * scale))
          local chars = {}
          for target_index = 0, target_count - 1 do
            local source_index = math.floor(target_index / scale)
            chars[#chars + 1] = vim.fn.strcharpart(line, source_index, 1)
          end
          resized[line_index] = table.concat(chars)
        end
        return resized
      end

      dashboard.section.header.opts = { position = "center", hl = "AlphaHeader" }

      dashboard.config.layout = {
        { type = "padding", val = 2 },
        dashboard.section.header,
      }
      dashboard.config.opts.margin = 0
      alpha.setup(dashboard.config)
    end,
  },
}

