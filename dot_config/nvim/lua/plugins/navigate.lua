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
      vim.keymap.set("n", "<leader>hh", function()
        require("harpoon.ui").toggle_quick_menu()
      end, { desc = "Harpoon quick menu" })
      vim.keymap.set("n", "<leader>hl", "<cmd>Telescope harpoon marks<cr>", { desc = "Harpoon list" })
      vim.keymap.set("n", "<leader>a", function()
        require("harpoon.mark").add_file()
      end, { desc = "Harpoon add file" })
      vim.keymap.set("n", "<leader>hD", function()
        require("harpoon.mark").clear_all()
      end, { desc = "Harpoon Clear ALL File" })
      vim.keymap.set("n", "<leader>hn", function()
        require("harpoon.ui").nav_next()
      end, { desc = "Harpoon nav next file" })
      vim.keymap.set("n", "<leader>hp", function()
        require("harpoon.ui").nav_prev()
      end, { desc = "Harpoon nav prev file" })
      -- nav_file by idx
      vim.keymap.set("n", "<leader>ho", function()
        require("harpoon.ui").nav_file(1)
      end, { desc = "Harpoon nav file 1" })
      vim.keymap.set("n", "<leader>hi", function()
        require("harpoon.ui").nav_file(2)
      end, { desc = "Harpoon nav file 2" })
      vim.keymap.set("n", "<leader>hw", function()
        require("harpoon.ui").nav_file(3)
      end, { desc = "Harpoon nav file 3" })
      vim.keymap.set("n", "<leader>hs", function()
        require("harpoon.ui").nav_file(4)
      end, { desc = "Harpoon nav file 4" })
      -- set curretn file by idx
      vim.keymap.set("n", "<leader>hO", function()
        require("harpoon.mark").set_current_at(1)
      end, { desc = "Harpoon set index 1 file" })
      vim.keymap.set("n", "<leader>hI", function()
        require("harpoon.ui").set_current_at(2)
      end, { desc = "Harpoon set index 2 file" })
      vim.keymap.set("n", "<leader>hW", function()
        require("harpoon.ui").set_current_at(3)
      end, { desc = "Harpoon set index 3 file" })
      vim.keymap.set("n", "<leader>hS", function()
        require("harpoon.ui").set_current_at(4)
      end, { desc = "Harpoon set index 4 file" })
    end,
  },
}
