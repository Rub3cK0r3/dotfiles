-- UI entrypoint - rub3ck0r3
local modules = {
  "basic",
  "misc",
  "transparency",
  "smear_cursor",
  "dashboard",
  "notes"
}

for _, m in ipairs(modules) do
  require("ui." .. m)
end

