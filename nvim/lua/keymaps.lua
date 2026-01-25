-- keymaps for my custom config -rub3ck0r3
-- Leader
vim.g.mapleader = " " -- i set the leader to space

-- Define a helper for keymaps
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- FZF keymaps
map("n", "<leader>f", ":Rg<CR>", { desc = "search text", noremap = true, silent = true })
map("n", "<leader>b", ":Buffers<CR>", { desc = "buffers", noremap = true, silent = true })

-- Vim-Fugitive keymaps
map("n", "<leader>gs", ":Git<CR>", opts)       -- Git status
map("n", "<leader>ga", ":Gwrite<CR>", opts)    -- Stage current file
map("n", "<leader>gc", ":Git commit<CR>", opts) -- Commit changes
map("n", "<leader>gp", ":Git push<CR>", opts)  -- Push
map("n", "<leader>gl", ":Git pull<CR>", opts)  -- Pull
map("n", "<leader>gd", ":Gdiff<CR>", opts)     -- Diff current file
map("n", "<leader>gb", ":Gblame<CR>", opts)    -- Blame current line

