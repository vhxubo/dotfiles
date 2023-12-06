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
        -- https://github.com/neovim/neovim/blob/master/runtime/lua/vim/_defaults.lua#L73-L79
        local function get_visual_selection()
          local save_a = vim.fn.getreginfo("a")
          vim.cmd([[norm! "ay]])
          local selection = vim.fn.getreg("a", 1)
          vim.fn.setreg("a", save_a)
          return selection
        end
        local selection = get_visual_selection()
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
  {
    "piersolenski/wtf.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {},
    keys = {
      {
        mode = { "n" },
        "gw",
        function()
          require("wtf").search()
        end,
        desc = "Search diagnostic with Google",
      },
    },
  },
}
