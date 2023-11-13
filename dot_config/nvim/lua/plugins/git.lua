return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>G", "<cmd>G<cr>")
    end,
  },
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
