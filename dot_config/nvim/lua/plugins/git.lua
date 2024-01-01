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
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      require("git-conflict").setup({
        default_mappings = {
          next = "]g",
          prev = "[g",
        },
      })
    end,
  },
}
