return {
  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local title = "SYSTEMS // BACKEND"
      local subtitle = "OPERATOR CONSOLE"
      local width = math.max(#title, #subtitle)
      local border = "+" .. string.rep("-", width + 2) .. "+"
      local function frame(text)
        return "| " .. text .. string.rep(" ", width - #text) .. " |"
      end

      dashboard.section.header.val = {
        border,
        frame(title),
        frame(subtitle),
        border,
      }
      dashboard.section.header.opts = { position = "center", hl = "Function" }
      dashboard.section.buttons.val = {
        dashboard.button("f", "Find files", "<cmd>Files<cr>"),
        dashboard.button("/", "Search text", "<cmd>Rg<cr>"),
        dashboard.button("g", "Git status", "<cmd>Git<cr>"),
        dashboard.button("c", "Edit config", "<cmd>edit $MYVIMRC<cr>"),
        dashboard.button("q", "Quit", "<cmd>qa<cr>"),
      }
      dashboard.section.buttons.opts.spacing = 0
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.width = width + 8
        button.opts.hl = "Normal"
        button.opts.hl_shortcut = "DiagnosticInfo"
        button.opts.align_shortcut = "right"
      end
      dashboard.section.footer.val = "SYSTEMS // READY"
      dashboard.section.footer.opts = { position = "center", hl = "Comment" }
      dashboard.config.layout = {
        { type = "padding", val = 1 },
        dashboard.section.header,
        { type = "padding", val = 1 },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        dashboard.section.footer,
      }
      dashboard.config.opts.margin = 4
      alpha.setup(dashboard.config)
    end,
  },
}