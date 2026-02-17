-- Basic UI
vim.o.number = true
vim.o.relativenumber = true
vim.o.swapfile = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.termguicolors = true
vim.o.background = "dark"
vim.cmd("colorscheme catppuccin")

vim.cmd("hi Normal guibg=#010101 guifg=#C5C8C6")
vim.cmd("hi NormalNC guibg=#292b2e")