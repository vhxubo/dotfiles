return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>G", "<cmd>G<cr>")
    end,
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
