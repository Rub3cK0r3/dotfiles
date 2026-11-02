for _, group in ipairs({
  "Normal",
  "NormalNC",
  "NormalFloat",
  "FloatBorder",
  "StatusLine",
  "StatusLineNC",
  "WinSeparator",
}) do
  vim.api.nvim_set_hl(0, group, { bg = "none" })
end

local function set_transparent(group, source, options)
  local source_hl = vim.api.nvim_get_hl(0, { name = source, link = false })
  local highlight = vim.tbl_extend("force", { bg = "none" }, options or {})
  if source_hl.fg then
    highlight.fg = source_hl.fg
  end
  vim.api.nvim_set_hl(0, group, highlight)
end

local function apply_blink_highlights()
  set_transparent("BlinkCmpMenu", "Pmenu")
  set_transparent("BlinkCmpMenuBorder", "Function")
  set_transparent("BlinkCmpDoc", "Normal")
  set_transparent("BlinkCmpDocBorder", "Keyword")
  set_transparent("BlinkCmpDocSeparator", "Comment")
  set_transparent("BlinkCmpSignatureHelp", "Normal")
  set_transparent("BlinkCmpSignatureHelpBorder", "Special")
  set_transparent("BlinkCmpLabel", "Pmenu")
  set_transparent("BlinkCmpLabelMatch", "Search", { bold = true })
  set_transparent("BlinkCmpLabelDetail", "Comment", { italic = true })
  set_transparent("BlinkCmpLabelDescription", "Comment", { italic = true })
  set_transparent("BlinkCmpSource", "Special", { italic = true })
  set_transparent("BlinkCmpGhostText", "Comment", { italic = true })

  for kind, group in pairs({
    Class = "Type",
    Constant = "Constant",
    Enum = "Type",
    Field = "Identifier",
    File = "Directory",
    Function = "Function",
    Interface = "Type",
    Keyword = "Keyword",
    Method = "Function",
    Module = "Special",
    Property = "Identifier",
    Snippet = "String",
    Struct = "Type",
    Text = "String",
    TypeParameter = "Type",
    Variable = "Identifier",
  }) do
    vim.api.nvim_set_hl(0, "BlinkCmpKind" .. kind, { link = group })
  end

  vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { link = "PmenuSel" })
  vim.api.nvim_set_hl(0, "BlinkCmpLabelDeprecated", { link = "Comment", strikethrough = true })
  vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpActiveParameter", { link = "LspSignatureActiveParameter" })
end

apply_blink_highlights()

local group = vim.api.nvim_create_augroup("user_blink_highlights", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = group,
  callback = apply_blink_highlights,
})
vim.api.nvim_create_autocmd("User", {
  group = group,
  pattern = "VeryLazy",
  callback = apply_blink_highlights,
})