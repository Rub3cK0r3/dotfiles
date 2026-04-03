-- make gf work with [[note]] links in Markdown
vim.cmd([[
  autocmd FileType markdown setlocal includeexpr=substitute(v:fname,'\\v\\[\\[(.*)\\]\\]','\\1.md','')
]])


