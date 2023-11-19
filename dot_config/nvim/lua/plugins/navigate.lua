return {
  {
    "andymass/vim-matchup",
    config = function(_, opts)
      opts.matchup = {
        enable = true,
        -- set up for match ' and "
        enable_quotes = true,
      }
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  { "christoomey/vim-tmux-navigator", event = "BufReadPre" },
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
