local plugins = {}

local modules = {
  "plugins.treesitter",
  "plugins.mason",      
  "plugins.lspconfig",  
  "plugins.nvim-cmp",  
  "plugins.comment",
  "plugins.autoclose",
  "plugins.fugitive",
  "plugins.fzf",
  "plugins.telescope",
  "plugins.colorscheme",
  "plugins.lualine",
}

for _, mod in ipairs(modules) do
  local ok, p = pcall(require, mod)
  if ok then
    if type(p) == "table" then
      -- si p es lista de plugins
      for _, plug in ipairs(p) do
        table.insert(plugins, plug)
      end
    else
      vim.notify("Plugin retornado no es tabla: " .. mod, vim.log.levels.ERROR)
    end
  else
    vim.notify("Error cargando plugin: " .. mod .. "\n" .. p, vim.log.levels.ERROR)
  end
end

return plugins

