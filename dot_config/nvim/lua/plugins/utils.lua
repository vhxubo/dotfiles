return {
  { "h-hg/fcitx.nvim" },
  { "wakatime/vim-wakatime" },
  {
    "abecodes/tabout.nvim",
    event = "InsertEnter",
    opts = {
      act_as_tab = false,
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      {
        "hrsh7th/nvim-cmp",
        config = function(_, opts)
          local luasnip = require("luasnip")
          local cmp = require("cmp")

          opts.mapping = vim.tbl_extend("force", opts.mapping, {
            ["<Tab>"] = function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
              else
                fallback()
              end
            end,
            ["<S-Tab>"] = function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
              else
                fallback()
              end
            end,
          })
          cmp.setup(opts)
        end,
      },

      "L3MON4D3/LuaSnip",
    },
  },
  { "ThePrimeagen/vim-be-good", event = "VeryLazy" },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "BufRead",
    config = function()
      require("ufo").setup({
        provider_selector = function()
          return { "treesitter", "indent" }
        end,
      })
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
    end,
  },
  {
    "gelguy/wilder.nvim",
    config = function()
      local wilder = require("wilder")
      wilder.setup({ modes = { ":" } })
      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer({
          pumblend = 20,
          min_width = "100%", -- minimum height of the popupmenu, can also be a number
          min_height = "50%", -- to set a fixed height, set max_height to the same value
          reverse = 0, -- if 1, shows the candidates from bottom to top
        })
      )
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    config = true,
  },
}
