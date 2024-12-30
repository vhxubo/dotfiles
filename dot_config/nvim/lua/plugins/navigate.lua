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
    branch = "harpoon2",
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({
        settings = {
          save_on_toggle = true,
        },
      })
      vim.keymap.set("n", "<C-2>", function()
        harpoon:list():prev()
      end)
      vim.keymap.set("n", "<C-3>", function()
        harpoon:list():next()
      end)

      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():append()
      end, { desc = "Harpoon add mark" })
      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set("n", "<C-7>", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<C-8>", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<C-9>", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<C-0>", function()
        harpoon:list():select(4)
      end)
    end,
  },
  { "nacro90/numb.nvim", config = true },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      {
        "w",
        "<cmd>lua require('spider').motion('w')<CR>",
        desc = "Spider-w",
      },
      {
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        desc = "Spider-e",
      },
      {
        "b",
        "<cmd>lua require('spider').motion('b')<CR>",
        desc = "Spider-b",
      },
      {
        "ge",
        "<cmd>lua require('spider').motion('ge')<CR>",
        desc = "Spider-ge",
      },
    },
  },
}
