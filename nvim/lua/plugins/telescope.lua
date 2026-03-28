-- I also can use telescope, but it's not usual
return {
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})
    end,
  },
}

