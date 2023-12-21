return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    init = function() end,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").load({ paths = "./snippets" })
    end,
  },
  {
    "lukas-reineke/headlines.nvim",
    enabled = false,
  },
  {
    "catppuccin",
    enabled = false,
  },
  {
    "echasnovski/mini.ai",
    opts = {
      custom_textobjects = {
        -- support HTML Attributes
        x = { '%s:?[%w%p]+=".-"' },
      },
    },
  },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        search = {
          enabled = false,
        },
        char = {
          enabled = false,
        },
      },
    },
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
  {
    "echasnovski/mini.surround",
    enabled = false,
  },
  {
    "echasnovski/mini.comment",
    enabled = false,
  },
}
