-- plugins.lua

require("lazy").setup({
  -- LSP + Mason
  { "neovim/nvim-lspconfig",event = { "BufReadPre", "BufNewFile" }, },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = require('lsp.lsp_servers')
      })
    end,
  },
  -- Git
  { "tpope/vim-fugitive", lazy=true, },

  -- Autocomplete + Snippets
  { "hrsh7th/nvim-cmp", event = "InsertEnter" },
  { "hrsh7th/cmp-nvim-lsp" , event = "InsertEnter"},
  { "hrsh7th/cmp-buffer" , event = "InsertEnter"},
  { "hrsh7th/cmp-path" , event = "InsertEnter"},
  { "L3MON4D3/LuaSnip" , event = "InsertEnter"},
  { "saadparwaiz1/cmp_luasnip" , event = "InsertEnter"},

  -- Java config 
  { "mfussenegger/nvim-jdtls", ft = "java" },

  -- FZF
  { "junegunn/fzf", build = "./install --all" },
  { "junegunn/fzf.vim" },

  -- Autoclose brackets / quotes
  {
    "m4xshen/autoclose.nvim",
    config = function()
      require("autoclose").setup()
    end,
  },

  -- Comments
  { "numToStr/Comment.nvim" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", event = { "BufRead", "BufNewFile" }, build = ":TSUpdate" },

  -- Optional formatter
  { "nvimtools/none-ls.nvim" },

  -- Lualine
  {"nvim-lualine/lualine.nvim"},

  -- Theme
  {"folke/tokyonight.nvim", event = "VimEnter" },

})

