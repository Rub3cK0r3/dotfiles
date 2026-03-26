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

-- Colorscheme
vim.cmd("colorscheme sacredforest")
vim.api.nvim_set_hl(0, "Normal", { fg="#F5EBD9", bg="#2B303B" })  
vim.api.nvim_set_hl(0, "Comment", { fg="#B0B0B0", italic=true })  
vim.api.nvim_set_hl(0, "Function", { fg="#88C0D0", bold=true })  
vim.api.nvim_set_hl(0, "Keyword", { fg="#EBCB8B", bold=true })  
vim.api.nvim_set_hl(0, "String", { fg="#A3BE8C", bold=false })  
vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", fg="#969696" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE", fg = "#EBCB8B", bold=true })  

return M
