local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>f", "<cmd>Files<cr>", { desc = "Find files", noremap = true, silent = true })
map("n", "<leader>b", "<cmd>Buffers<cr>", { desc = "List buffers", noremap = true, silent = true })
map("n", "<leader>/", "<cmd>Rg<cr>", { desc = "Search text", noremap = true, silent = true })

-- Terminal-first: fast embedded terminal
map("n", "<leader>tt", "<cmd>split | terminal<cr>", { desc = "Terminal (split)", noremap = true, silent = true })

-- Vim-Fugitive keymaps
map("n", "<leader>gs", "<cmd>Git<cr>", vim.tbl_extend("force", opts, { desc = "Git status" }))
map("n", "<leader>ga", "<cmd>Gwrite<cr>", vim.tbl_extend("force", opts, { desc = "Stage file" }))
map("n", "<leader>gc", "<cmd>Git commit<cr>", vim.tbl_extend("force", opts, { desc = "Git commit" }))
map("n", "<leader>gp", "<cmd>Git push<cr>", vim.tbl_extend("force", opts, { desc = "Git push" }))
map("n", "<leader>gl", "<cmd>Git pull<cr>", vim.tbl_extend("force", opts, { desc = "Git pull" }))
map("n", "<leader>gd", "<cmd>Gdiffsplit<cr>", vim.tbl_extend("force", opts, { desc = "Git diff" }))
map("n", "<leader>gb", "<cmd>Gblame<cr>", vim.tbl_extend("force", opts, { desc = "Git blame" }))

