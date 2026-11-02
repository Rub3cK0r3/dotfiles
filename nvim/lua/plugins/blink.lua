return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    lazy = false,
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function(_, opts)
      require("blink.cmp").setup(opts)
      local plugin_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h")
      local config_dir = vim.fn.fnamemodify(plugin_dir, ":h:h")
      dofile(config_dir .. "/lua/ui/transparency.lua")
    end,
    opts = {
      keymap = {
        preset = "none",
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide" },
        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
      },
      appearance = {
        nerd_font_variant = "mono",
        kind_icons = {
          Text = "󰉿",
          Method = "󰊕",
          Function = "󰊕",
          Constructor = "󰒓",
          Field = "󰜢",
          Variable = "󰆦",
          Property = "󰖷",
          Class = "󱡠",
          Interface = "󱡠",
          Module = "󰅩",
          Unit = "󰪚",
          Value = "󰦨",
          Enum = "󰦨",
          Keyword = "󰻾",
          Constant = "󰏿",
          Snippet = "󱄽",
          Color = "󰏘",
          File = "󰈔",
          Reference = "󰬲",
          Folder = "󰉋",
          EnumMember = "󰦨",
          Operator = "󰪚",
          TypeParameter = "󰬛",
        },
      },
      completion = {
        accept = { auto_brackets = { enabled = true } },
        menu = {
          border = "single",
          winblend = 14,
          max_height = 8,
          scrollbar = false,
          winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
          draw = {
            gap = 1,
            padding = 1,
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "source_name" },
            },
            components = {
              source_name = {
                width = { max = 8 },
                text = function(ctx)
                  return "[" .. ctx.source_name .. "]"
                end,
                highlight = "BlinkCmpSource",
              },
            },
          },
        },
        documentation = {
          auto_show = false,
          treesitter_highlighting = false,
          window = {
            border = "single",
            winblend = 18,
            max_width = 64,
            max_height = 14,
            scrollbar = false,
            winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
          },
        },
        ghost_text = { enabled = false },
      },
      signature = {
        enabled = true,
        window = {
          border = "single",
          winblend = 18,
          winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          lsp = { name = "LSP" },
          path = { name = "PATH" },
          snippets = { name = "SNIP" },
          buffer = { name = "BUF" },
        },
      },
      fuzzy = {
        implementation = "prefer_rust",
        prebuilt_binaries = { download = false },
      },
    },
  },
}