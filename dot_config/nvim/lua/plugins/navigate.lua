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
      harpoon:setup()
      require("telescope").load_extension("harpoon")
      vim.keymap.set("n", "<leader>sp", function()
        vim.cmd("Telescope harpoon marks")
        local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
        vim.api.nvim_feedkeys(esc, "x", false)
      end, { desc = "Harpoon list" })

      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():append()
      end, { desc = "Harpoon add mark" })
      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set("n", "<C-y>", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<C-g>", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<C-m>", function()
        harpoon:list():select(4)
      end)
    end,
  },
}
