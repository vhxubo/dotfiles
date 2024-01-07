return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({ "telescope" })
      vim.keymap.set("n", "<C-p>", "<cmd>lua require('fzf-lua').files()<cr>", { silent = true })
    end,
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })

      require("oil").setup({
        skip_confirm_for_simple_edits = true,
        keymaps = {
          ["<C-s>"] = false,
          ["<C-v>"] = "actions.select_vsplit",
          ["<C-h>"] = false,
          ["<C-x>"] = "actions.select_split",
          ["<C-CR>"] = "actions.select_tab",
          ["<C-d>"] = "actions.preview_scroll_down",
          ["<C-u>"] = "actions.preview_scroll_up",
          ["<C-q>"] = "actions.send_to_qflist",
          ["H"] = "actions.parent",
          ["<BS>"] = "actions.parent",
          ["L"] = "actions.select",
        },
      })
    end,
  },
  -- eunuch.vim: Helpers for UNIX
  -- :Remove :Delete :SudoWrite :Mkdir and so on..
  { "tpope/vim-eunuch" },
}
