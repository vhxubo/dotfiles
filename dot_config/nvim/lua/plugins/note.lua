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
  {
    "mickael-menu/zk-nvim",
    config = function()
      require("zk").setup({})
      local opts = { noremap = true, silent = false }

      -- Create a new note after asking for its title.
      vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)

      -- Open notes.
      vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
      -- Open notes associated with the selected tags.
      vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)

      -- Search for the notes matching a given query.
      vim.api.nvim_set_keymap(
        "n",
        "<leader>zf",
        "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
        opts
      )
      -- Search for the notes matching the current visual selection.
      vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)
    end,
  },
}
