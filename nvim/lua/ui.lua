-- Basic UI
vim.o.number = true
vim.o.relativenumber = true
vim.o.swapfile = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Function to make backgrounds transparent
local function make_transparent()
  -- This clears the Normal background for all themes
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })  -- inactive windows
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- floating windows
  vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" }) -- nvim-tree
  vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" }) -- telescope
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" }) -- vertical splits
end

-- Apply transparency **every time a colorscheme is loaded**
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    make_transparent()
  end,
})

vim.opt.termguicolors = true
vim.o.background = "dark"
vim.cmd("colorscheme tokyonight")
