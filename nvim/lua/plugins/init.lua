local plugins = {}

-- rub3ck0r3's plugins for now..
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
  "plugins.smear_cursor",
}

-- For every module i need to check if it's
-- a valid table and if thats the case insert it into the table (used plugins)
for _, mod in ipairs(modules) do
  local ok, p = pcall(require, mod)
  if ok then
    if type(p) == "table" then
      -- si p es lista de plugins
      for _, plug in ipairs(p) do
        table.insert(plugins, plug)
      end
    else
      vim.notify("Returned Plugin NOT a table: " .. mod, vim.log.levels.ERROR)
    end
  else
    vim.notify("Error loading plugin: " .. mod .. "\n" .. p, vim.log.levels.ERROR)
  end
end

return plugins

