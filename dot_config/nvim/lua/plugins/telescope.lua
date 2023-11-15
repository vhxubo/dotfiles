return {
  {
    "telescope.nvim",
    config = function()
      require("telescope").setup({ defaults = { file_ignore_patterns = { "public" } } })
    end,
  },
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          require("telescope").load_extension("live_grep_args")
        end,
        keys = {
          {
            "<leader>sl",
            ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
            desc = "Live Grep Args",
          },
        },
      },
    },
  },
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        "<leader>sf",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = true,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
    },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
  {
    "mini.hipatterns",
    opts = {
      highlighters = {
        hardcode = { pattern = "%f[%w]()hard code()%f[%W]", group = "MiniHipatternsHack" },
      },
    },
  },
}
