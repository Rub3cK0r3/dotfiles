return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },

    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- LSP capabilities shared with LSP configuration.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_lsp = require("cmp_nvim_lsp")
      capabilities = cmp_lsp.default_capabilities(capabilities)

      vim.g.lsp_capabilities = capabilities

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = {
          -- Keep Enter completely normal.
          ["<CR>"] = nil,

          -- Manual completion.
          ["<C-Space>"] = cmp.mapping.complete(),

          -- Navigate completion / expand snippets.
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          -- Close completion menu.
          ["<C-e>"] = cmp.mapping.abort(),
        },

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),

        completion = {
          completeopt = "menu,menuone,noselect",
        },

        -- Keep the editor visually clean.
        experimental = {
          ghost_text = false,
        },
      })
    end,
  },
}
