return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({ "telescope" })
      vim.keymap.set("n", "<C-p>", "<cmd>lua require('fzf-lua').files()<cr>", { silent = true })
    end,
  },
}
