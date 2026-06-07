-- I use gruvbox, rub3ck0r3 likes it so much!
return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        transparent_mode = false,
      })

      vim.o.background = "dark"
      vim.cmd("colorscheme gruvbox")
    end,
  },
}

