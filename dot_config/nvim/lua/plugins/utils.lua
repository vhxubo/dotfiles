return {
  { "h-hg/fcitx.nvim" },
  { "wakatime/vim-wakatime" },
  { "mg979/vim-visual-multi" },
  { "tpope/vim-fugitive" },
  { "johmsalas/text-case.nvim", config = true },
  {
    "abecodes/tabout.nvim",
    event = "InsertEnter",
    config = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
    },
  },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup()
    end,
  },
}
