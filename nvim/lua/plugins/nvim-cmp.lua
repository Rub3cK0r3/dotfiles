return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp_ok, cmp = pcall(require, "cmp")
      if not cmp_ok then return end

      local luasnip_ok, luasnip = pcall(require, "luasnip")
      if not luasnip_ok then return end

      -- LSP capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_lsp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if cmp_lsp_ok then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end
      vim.g.lsp_capabilities = capabilities -- opcional: guardar global para tu LSP setup

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
          ["<C-Space>"] = cmp.mapping.complete(),
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
        }),
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
        experimental = {
          ghost_text = true, -- preview de texto sugerido
        },
      })
    end,
  },
}
