return {
  {
    "renerocksai/telekasten.nvim",
    config = function()
      require("telekasten").setup({
        home = vim.fn.expand("~/Nutstore Files/notes/0-zettelkasten"),
      })
      vim.keymap.set("n", "<leader>N", "<cmd>Telekasten panel<CR>")

      vim.keymap.set("n", "<leader>nl", "<cmd>Telekasten find_notes<CR>")
      vim.keymap.set("n", "<leader>ns", "<cmd>Telekasten search_notes<CR>")
      vim.keymap.set("n", "<leader>nd", "<cmd>Telekasten goto_today<CR>")
      vim.keymap.set("n", "<leader>nz", "<cmd>Telekasten follow_link<CR>")
      vim.keymap.set("n", "<leader>nn", "<cmd>Telekasten new_note<CR>")
      vim.keymap.set("n", "<leader>nc", "<cmd>Telekasten show_calendar<CR>")
      vim.keymap.set("n", "<leader>nb", "<cmd>Telekasten show_backlinks<CR>")
      vim.keymap.set("n", "<leader>nI", "<cmd>Telekasten insert_img_link<CR>")
      vim.keymap.set("n", "g-", "<cmd>Telekasten toggle_todo<CR>")
    end,
  },
}
