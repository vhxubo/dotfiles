return {
  {
    "itchyny/vim-external",
    config = function()
      vim.keymap.set("n", "<leader>o", function()
        local text = vim.fn.input("Search: ")
        vim.fn["external#browser"](text)
      end, { desc = "Open browser with user typed text" })
      vim.keymap.set(
        "x",
        "<leader>o",
        ":call external#browser(external#get_text('v'))<CR>",
        { desc = "Open browser with selection" }
      )
      vim.keymap.set("x", "<leader>O", function()
        -- FIXME: selection 是上一次的
        local selection = vim.fn["external#get_text"]("v")
        print([[[.config/nvim/lua/plugins/browser.lua:17] selection  = ]] .. selection)
        local text = vim.fn.input("Search: ", selection)
        vim.fn["external#browser"](text)
      end, { desc = "Search" })
    end,
  },
  {
    "dhruvmanila/browser-bookmarks.nvim",
    version = "*",
    dependencies = {
      "itchyny/vim-external",
    },
    keys = {
      {
        "<leader>fo",
        function()
          require("telescope").extensions.bookmarks.bookmarks()
        end,
        desc = "Open Selected Bookmark",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      opts.extensions = {
        bookmarks = {
          selected_browser = "chrome",
          url_open_plugin = "vim_external",
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("bookmarks")
    end,
  },
}
