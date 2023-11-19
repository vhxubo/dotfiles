return {
  { "h-hg/fcitx.nvim" },
  { "wakatime/vim-wakatime" },
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
  { "ThePrimeagen/vim-be-good" },
}
