-- UI entrypoint - rub3ck0r3

local path = vim.fn.stdpath("config") .. "/lua/ui"

for _, file in ipairs(vim.fn.readdir(path)) do
  if file:match("%.lua$") and file ~= "init.lua" then
    local mod = file:gsub("%.lua$", "")
    require("ui." .. mod)
  end
end

