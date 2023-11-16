return {
  {
    "tyru/open-browser.vim",
    keys = {
      {
        "<leader>o",
        ":OpenBrowserSmartSearch ",
        desc = "Open Browser Smart Search",
      },
    },
  },
  {
    "dhruvmanila/browser-bookmarks.nvim",
    version = "*",
    dependencies = {
      "tyru/open-browser.vim",
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
          url_open_plugin = "open_browser",
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("bookmarks")
    end,
  },
}
