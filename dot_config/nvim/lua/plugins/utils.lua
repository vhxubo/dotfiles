return {
  { "h-hg/fcitx.nvim" },
  { "wakatime/vim-wakatime" },
  {
    "andymass/vim-matchup",
    config = function(_, opts)
      opts.matchup = {
        enable = true,
        enable_quotes = true,
      }
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
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
  { "ThePrimeagen/vim-be-good" },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension("harpoon")
      vim.keymap.set("n", "<leader>hl", "<cmd>Telescope harpoon marks<cr>", { desc = "Harpoon list" })
      vim.keymap.set("n", "<leader>ha", function()
        require("harpoon.mark").add_file()
      end, { desc = "Harpoon add file" })
      vim.keymap.set("n", "<leader>hn", function()
        require("harpoon.ui").nav_next()
      end, { desc = "Harpoon nav next file" })
      vim.keymap.set("n", "<leader>hp", function()
        require("harpoon.ui").nav_prev()
      end, { desc = "Harpoon nav prev file" })
    end,
  },
}
