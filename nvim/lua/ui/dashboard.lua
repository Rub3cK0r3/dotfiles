-- rub3ck0r3's custom initial nvim dashboard, really cool btw.
require("dashboard").setup({
  theme = "doom",
  config = {
    header = {
      "",
      "@@@  @@@ @@@  @@@ @@@ @@@@@@@@@@  ",
      "@@!@!@@@ @@!  @@@ @@! @@! @@! @@! ",
      "@!@@!!@! @!@  !@! !!@ @!! !!@ @!@ ",
      "!!:  !!!  !: .:!  !!: !!:     !!: ",
      "::    :     ::    :    :      :   ",
      "",
      ":: access granted ::",
      "",
      "󱩊  @rub3ck0r3",
      "",
    },

    center = {
      {
        icon = "󱀹 ",
        desc = "New File",
        action = "enew",
        key = "n",
      },
      {
        icon = "󰩉 ",
        desc = "Search File",
        action = "Telescope find_files",
        key = "f",
      },
      {
        icon = "  ",
        desc = "Edit Config",
        action = "edit ~/.config/nvim/init.lua",
        key = "c",
      },
      {
        icon = "󰒲  ",
        desc = "Update Plugins",
        action = "Lazy update",
        key = "u",
      },
      {
        icon = "  ",
        desc = "Recent Files",
        action = "Telescope oldfiles",
        key = "r",
      },
      {
        icon = "󰈆 ",
        desc = "Exit",
        action = "qa",
        key = "q",
      },
    },
  },
})
