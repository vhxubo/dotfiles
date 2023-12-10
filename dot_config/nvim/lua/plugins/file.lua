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
          ["<C-d>"] = "actions.preview_scrool_down",
          ["<C-u>"] = "actions.preview_scrool_up",
          ["<C-q>"] = "actions.send_to_qflist",
          ["H"] = "actions.parent",
          ["L"] = "actions.select",
        },
      })
    end,
  },
  { "is0n/fm-nvim", cmd = { "Lf" } },
  { "tpope/vim-eunuch" },
  {
    "vhxubo/file-matches.nvim",
    dev = true,
    config = function()
      require("telescope").setup({
        extensions = {
          file_matches = {
            layout_strategy = "bottom_pane",
            layout_config = {
              prompt_position = "bottom",
              height = 0.8,
            },
          },
        },
      })
      require("telescope").load_extension("file_matches")
      vim.keymap.set("n", "gm", ":Telescope file_matches<cr>")
    end,
  },
}
