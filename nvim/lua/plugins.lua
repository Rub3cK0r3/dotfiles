-- plugins.lua

require("lazy").setup({
  -- LSP + Mason
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonUninstall", "MasonLog" },
    config = function()
      require("mason").setup()
    end,
  },
  -- Git
  { "tpope/vim-fugitive", cmd = { "Git", "G", "Gwrite", "Gread", "Gdiffsplit", "Gvdiffsplit", "Gclog", "Gblame" } },

  -- Autocomplete + Snippets
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },
    },
  },

  -- FZF
  { "junegunn/fzf", build = "./install --all", cmd = { "FZF" } },
  { "junegunn/fzf.vim", cmd = { "Rg", "Buffers", "Files", "GFiles", "History", "BLines", "Lines", "Ag" } },

  -- Telescope (structured navigation)
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})
    end,
  },

  -- Autoclose brackets / quotes
  {
    "m4xshen/autoclose.nvim",
    event = "InsertEnter",
    config = function()
      require("autoclose").setup()
    end,
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Treesitter - carga inmediata y estable
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = true,   -- lo cargamos cuando se requiera
    event = "BufReadPost",  -- después de abrir buffer
    config = function()
      local ok, ts = pcall(require, "nvim-treesitter.configs")
      if not ok then
        vim.notify("Error cargando nvim-treesitter", vim.log.levels.ERROR)
        return
      end

      ts.setup({
        ensure_installed = {
          "bash","c","cpp","css","dockerfile","go","html","java",
          "javascript","json","lua","python","rust","sql","typescript","yaml",
        },
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true,
      })
    end,
  }

  

  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = false,
          theme = "auto",
          globalstatus = true,
          section_separators = "",
          component_separators = "",
        },
      })
    end,
  },

  -- Colorscheme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 }

})

