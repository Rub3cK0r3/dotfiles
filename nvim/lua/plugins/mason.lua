-- Mason initial config, this is essential for rub3ck0r3s programming experience
--
return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      ui = { border = "single" }
    },
    config = function(_, opts)
      require("mason").setup(opts)
      vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH
    end,
  },
}

