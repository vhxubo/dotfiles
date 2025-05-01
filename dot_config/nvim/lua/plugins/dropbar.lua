return {
  {
    "Bekaboo/dropbar.nvim",
    enable = false,
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    opts = {
      menu = {
        win_configs = {
          height = function(menu)
            return math.max(1, math.min(#menu.entries, math.ceil(vim.go.lines / 2)))
          end,
        },
      },
    },
    config = function(_, opts)
      require("dropbar").setup(opts)
      vim.keymap.set("n", "<leader>fd", require("dropbar.api").pick, { desc = "Open dropbar picker" })
    end,
  },
}
