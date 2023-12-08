return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({ "telescope" })
      vim.keymap.set("n", "<C-p>", "<cmd>lua require('fzf-lua').files()<cr>", { silent = true })
    end,
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function(_, opts)
      require("oil").setup(opts)
      vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
    end,
  },
  { "is0n/fm-nvim", cmd = { "Lf" } },
  { "tpope/vim-eunuch" },
}
