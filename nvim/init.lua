-- init.lua for assembling everything together - rub3ck0r3

-- BOOTSTRAP lazy.nvim i prefer it cause it is a much optimized choice
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load personal configs
require("plugins") -- rub3ck0r3's simple effective plugins
-- note that i use the directory call, that's bcs i named init.lua to the main file lua/lsp/init.lua
require("lsp") -- rub3ck0r3's lsp configs for several languages
require("keymaps") -- rub3ck0r3's keymaps for efficient smooth workflow
require("ui") -- rub3ck0r3's UI nvim config (coloscheme,lualine,..)
require('misc') -- miscellaneus configs for small but necessary tweaks
