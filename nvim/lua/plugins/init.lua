local specs = {}

for _, module in ipairs({
  "blink",
  "colorscheme",
  "dashboard",
  "fzf",
  "fugitive",
  "lspconfig",
  "lualine",
  "mason",
  "smear_cursor",
}) do
  local module_specs = require("plugins." .. module)
  if type(module_specs[1]) == "string" then
    table.insert(specs, module_specs)
  else
    vim.list_extend(specs, module_specs)
  end
end

return specs