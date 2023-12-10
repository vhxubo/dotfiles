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
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.keybinds"] = {},
          ["core.concealer"] = {},
          ["core.qol.todo_items"] = {},
          ["core.summary"] = {},
          ["core.integrations.treesitter"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes",
            },
          },
        },
      })

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },
}
