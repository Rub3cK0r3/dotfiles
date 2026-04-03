-- Basic UI - rub3ck0r3
local M = {}

vim.o.number = true
vim.o.relativenumber = true
vim.o.swapfile = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true        
vim.opt.signcolumn = "no"      

vim.opt.termguicolors = true
vim.o.background = "dark"
vim.o.showmode = false

vim.opt.guifont = "Fira Code:h15"

vim.cmd("colorscheme kanagawa")

local groups = {
  "Normal", "NormalNC", "NormalFloat", "StatusLine", "StatusLineNC", "VertSplit",
}

for _, group in ipairs(groups) do
  vim.api.nvim_set_hl(0, group, { bg = "none" })
end

vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { bg = "none" })

-- Smear for a nice little tweak for rub3ck0r3 setup
require('smear_cursor').setup({
    delay = 0.02,
    intensity = 0.5,
    min_speed = 0.05,
    max_length = 12,
    hide_cursor = true,
})

-- rub3ck0r3's custom initial nvim dashboard, really cool btw.
require("dashboard").setup({
  theme = "doom",
  config = {
    header = {
      "",
      " ██████   █████ █████   █████ █████ ██████   ██████",
      "▒▒██████ ▒▒███ ▒▒███   ▒▒███ ▒▒███ ▒▒██████ ██████",
      " ▒███▒███ ▒███  ▒███    ▒███  ▒███  ▒███▒█████▒███",
      " ▒███▒▒███▒███  ▒███    ▒███  ▒███  ▒███▒▒███ ▒███",
      " ▒███ ▒▒██████  ▒▒███   ███   ▒███  ▒███ ▒▒▒  ▒███",
      " ▒███  ▒▒█████   ▒▒▒█████▒    ▒███  ▒███      ▒███",
      " █████  ▒▒█████    ▒▒███      █████ █████     █████",
      "▒▒▒▒▒    ▒▒▒▒▒      ▒▒▒      ▒▒▒▒▒ ▒▒▒▒▒     ▒▒▒▒▒",
      "",
      ":: access granted ::",
      "",
      "󱩊  @rub3ck0r3",
      "",
    },

    center = {
      {
        icon = "󱀹 ",
        desc = "New File",
        action = "enew",
        key = "n",
      },
      {
        icon = "󰩉 ",
        desc = "Search File",
        action = "Telescope find_files",
        key = "f",
      },
      {
        icon = "  ",
        desc = "Edit Config",
        action = "edit ~/.config/nvim/init.lua",
        key = "c",
      },
      {
        icon = "󰒲  ",
        desc = "Update Plugins",
        action = "Lazy update",
        key = "u",
      },
      {
        icon = "  ",
        desc = "Recent Files",
        action = "Telescope oldfiles",
        key = "r",
      },
      {
        icon = "󰈆 ",
        desc = "Exit",
        action = "qa",
        key = "q",
      },
    },
  },
})


return M
