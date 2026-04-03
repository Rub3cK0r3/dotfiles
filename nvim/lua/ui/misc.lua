-- Terminal / logs tweaks -- optional but needed by rub3ck0r3
vim.opt.synmaxcol = 240

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.log", "syslog", "messages", "*.audit", "*.conf", "*.cfg" },
  callback = function()
    vim.opt_local.wrap = false
    vim.opt_local.list = false
  end,
})

-- Infra files defaults (yaml/json/bash)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "yaml", "yaml.docker-compose" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sh", "bash" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})
