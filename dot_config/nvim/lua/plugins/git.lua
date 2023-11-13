return {
  { "tpope/vim-fugitive", keys = {
    {
      "<leader>G",
      "<cmd>G<cr>",
      desc = "Git status",
    },
  } },
  {
    "sindrets/diffview.nvim",
    keys = {
      {
        "<leader>gd",
        "<cmd>DiffviewOpen<cr>",
        desc = "Open Diffview",
      },
      {
        "<leader>gD",
        "<cmd>DiffviewClose<cr>",
        desc = "Close Diffview",
      },
    },
  },
}
