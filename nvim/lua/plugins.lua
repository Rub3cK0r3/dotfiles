-- plugins.lua

require("lazy").setup({
  -- LSP + Mason
  { "neovim/nvim-lspconfig" },
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
        ensure_installed = {
                "bashls",
                "clangd",
                "cssls",
                "dockerls",
                "docker_compose_language_service",
                "gopls",
                "html",
                "intelephense",
                "jdtls",
                "jsonls",
                "lua_ls", 
                "pyright",
                "rust_analyzer",
                "sqlls",
                "yamlls",
        }
    })
    end,
  },
  -- Git
  { "tpope/vim-fugitive", lazy=true, },

  -- Autocomplete + Snippets
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Java config 
  { "mfussenegger/nvim-jdtls" },

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
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Optional formatter
  { "nvimtools/none-ls.nvim" },

  -- Lualine
  {"nvim-lualine/lualine.nvim"},

  -- Theme
  {"folke/tokyonight.nvim"},

})

