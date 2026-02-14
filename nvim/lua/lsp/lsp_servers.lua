-- lsp_servers.lua
--
local M = {}

M.servers = {
  lua_ls = {
    filetypes = {"lua"},
  },
  tsserver = {
    filetypes = {"typescript", "typescriptreact", "javascript", "javascriptreact"},
  },
  pyright = {
    filetypes = {"python"},
  },
  bashls = {
    filetypes = {"sh", "bash"},
  },
  html = {
    filetypes = {"html"},
  },
  cssls = {
    filetypes = {"css", "scss", "less"},
  },
  jsonls = {
    filetypes = {"json"},
  },
  yamlls = {
    filetypes = {"yaml"},
  },
  dockerls = {
    filetypes = {"dockerfile"},
  },
  docker_compose_language_service = {
    filetypes = {"yaml"},
  },
  clangd = {
    filetypes = {"c", "cpp", "objc", "objcpp"},
  },
  rust_analyzer = {
    filetypes = {"rust"},
  },
  gopls = {
    filetypes = {"go"},
  },
  intelephense = {
    filetypes = {"php"},
  },
  sqlls = {
    filetypes = {"sql"},
  },
}

return M

