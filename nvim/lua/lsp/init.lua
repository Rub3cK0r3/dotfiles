-- lsp main config file
--
local lsp_path = vim.fn.stdpath("lsp") .. "/lsp-languages"

-- add path to runtime so require() works
vim.opt.rtp:append(lsp_path)

local M = {}
for _, file in ipairs(vim.fn.globpath(lsp_path, "*.lua", 0, 1)) do
  local name = file:match("^.+/(.+)%.lua$") -- get filename without extension
  if name then
    M[name] = require(name) -- require each LSP config automatically
  end
end

-- MASON + LSPCONFIG: ensure installed servers match your configs
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = vim.tbl_keys(M), -- install only what you have configs for
})

-- OPTIONAL: setup each LSP server with its config
local lspconfig = require("lspconfig")
for server, config in pairs(M) do
  lspconfig[server].setup(config)
end
