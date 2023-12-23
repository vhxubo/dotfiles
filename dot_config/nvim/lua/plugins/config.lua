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
    keys = {
      { "S", false, mode = { "n", "x", "o" } },
      {
        "<CR>",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
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
