-- I use kanagawa, rub3ck0r3 likes it so much!
return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      require("kanagawa").setup({
        compile = true,
        theme = "wave",
        background = "hard",
        dimInactive = false,
      })
    end,
  },
}
