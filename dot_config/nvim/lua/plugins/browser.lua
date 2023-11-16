return {
  {
    "dhruvmanila/browser-bookmarks.nvim",
    version = "*",
    dependencies = {
      "tyru/open-browser.vim",
    },
    keys = {
      {
        "<leader>fu",
        function()
          require("telescope").extensions.bookmarks.bookmarks()
        end,
        desc = "Open Select Bookmark",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      opts.extensions = {
        bookmarks = {
          selected_browser = "chrome",
          url_open_plugin = "open_browser",
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("bookmarks")
    end,
  },
}
