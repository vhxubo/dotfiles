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
      harpoon:extend({
        UI_CREATE = function(cx)
          vim.keymap.set("n", "<C-v>", function()
            harpoon.ui:select_menu_item({ vsplit = true })
          end, { buffer = cx.bufnr })

          vim.keymap.set("n", "<C-x>", function()
            harpoon.ui:select_menu_item({ split = true })
          end, { buffer = cx.bufnr })

          vim.keymap.set("n", "<C-CR>", function()
            harpoon.ui:select_menu_item({ tabedit = true })
          end, { buffer = cx.bufnr })
        end,
      })
      require("telescope").load_extension("harpoon")
      vim.keymap.set("n", "<leader>hp", function()
        harpoon:list():prev()
      end)
      vim.keymap.set("n", "<leader>hn", function()
        harpoon:list():next()
      end)

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
      -- doesn't work, need set in keymaps.lua
      -- vim.keymap.set("n", "<C-b>", function()
      --   harpoon:list():select(3)
      -- end)
      vim.keymap.set("n", "<C-m>", function()
        harpoon:list():select(4)
      end)
    end,
  },
  {
    "harrisoncramer/jump-tag",
    ft = { "vue", "html", "javascriptreact", "typescriptreact" },
    keys = {
      {
        "[l",
        function()
          require("jump-tag").jumpPrevSibling()
        end,
        { desc = "Jump to prev sibling tag" },
      },
      {
        "]l",
        function()
          require("jump-tag").jumpNextSibling()
        end,
        { desc = "Jump to next sibling tag" },
      },
      {
        "[L",
        function()
          require("jump-tag").jumpParent()
        end,
        { desc = "Jump to parent tag" },
      },
      {
        "]L",
        function()
          require("jump-tag").jumpChild()
        end,
        { desc = "Jump to child tag" },
      },
    },
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
