return {
  { "h-hg/fcitx.nvim" },
  { "wakatime/vim-wakatime" },
  { "mg979/vim-visual-multi" },
  { "christoomey/vim-tmux-navigator", event = "BufReadPre" },
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
}
