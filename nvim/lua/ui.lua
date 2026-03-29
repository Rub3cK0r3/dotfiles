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

vim.cmd("colorscheme kanagawa")

local groups = {
  "Normal",
  "NormalNC",
  "NormalFloat",
  "VertSplit",
  "StatusLine",
  "StatusLineNC",
  "SignColumn",
  "Pmenu",
  "PmenuSel",
  "TabLine",
  "TabLineFill",
  "TabLineSel",
  "ColorColumn",
  "StatusLineTerm",
  "StatusLineTermNC",
  "LineNr",
  "CursorLineNr",
}

for _, group in ipairs(groups) do
  vim.cmd(string.format("hi %s guibg=#010101", group))
end

return M
