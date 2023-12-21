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
  {
    "harrisoncramer/jump-tag",
    config = function()
      vim.keymap.set("n", "[l", function()
        require("jump-tag").jumpPrevSibling()
      end, { desc = "Jump to prev sibling tag" })
      vim.keymap.set("n", "]l", function()
        require("jump-tag").jumpNextSibling()
      end, { desc = "Jump to next sibling tag" })
      vim.keymap.set("n", "[L", function()
        require("jump-tag").jumpParent()
      end, { desc = "Jump to parent tag" })
      vim.keymap.set("n", "]L", function()
        require("jump-tag").jumpChild()
      end, { desc = "Jump to child tag" })
    end,
  },
  {
    "jinh0/eyeliner.nvim",
    opts = {
      highlight_on_key = true, -- show highlights only after keypress
      dim = true, -- dim all other characters if set to true (recommended!)
    },
  },
  { "gbprod/stay-in-place.nvim", config = true },
  { "nacro90/numb.nvim", config = true },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      {
        "w",
        "<cmd>lua require('spider').motion('w')<CR>",
        { desc = "Spider-w" },
      },
      {
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        { desc = "Spider-e" },
      },
      {
        "b",
        "<cmd>lua require('spider').motion('b')<CR>",
        { desc = "Spider-b" },
      },
    },
  },
}
