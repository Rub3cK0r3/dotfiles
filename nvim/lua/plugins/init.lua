-- rub3ck0r3's plugins new implementation improving scalability...
--
local plugins = {}

local function get_plugin_modules()
  local modules = {}
  local path = vim.fn.stdpath("config") .. "/lua/plugins"

  for _, file in ipairs(vim.fn.readdir(path)) do
    if file:match("%.lua$") and file ~= "init.lua" then
      local name = file:gsub("%.lua$", "")
      table.insert(modules, "plugins." .. name)
    end
  end

  return modules
end

local function load_module(mod)
  local ok, result = pcall(require, mod)

  if not ok then
    vim.notify("Error loading " .. mod .. "\n" .. result, vim.log.levels.ERROR)
    return {}
  end

  if type(result) == "string" then
    return { result }
  elseif type(result) == "table" then
    return result
  else
    vim.notify("Invalid return type in " .. mod, vim.log.levels.ERROR)
    return {}
  end
end

for _, mod in ipairs(get_plugin_modules()) do
  local plugs = load_module(mod)
  vim.list_extend(plugins, plugs)
end

return plugins
