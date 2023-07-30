return {
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },
  {
    "telescope.nvim",
    config = function()
      require("telescope").setup({ defaults = { file_ignore_patterns = { "public" } } })
    end,
  },
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          require("telescope").load_extension("live_grep_args")
        end,
        keys = {
          {
            "<leader>sl",
            ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
            desc = "Live Grep Args",
          },
        },
      },
    },
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },
}
