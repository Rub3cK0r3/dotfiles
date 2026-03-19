-- Autocomplete (nvim-cmp) - rub3ck0r3
do
  local ok, cmp = pcall(require, "cmp")
  if ok then
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
      },
    })
  end
end

-- make gf work with [[note]] links in Markdown
vim.cmd([[
  autocmd FileType markdown setlocal includeexpr=substitute(v:fname,'\\v\\[\\[(.*)\\]\\]','\\1.md','')
]])

-- Terminal / logs tweaks
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

