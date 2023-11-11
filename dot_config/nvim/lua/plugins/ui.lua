return {
  { "rebelot/kanagawa.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "kanagawa-lotus",
      colorscheme = "kanagawa",
    },
  },
  {
    "dstein64/nvim-scrollview",
    config = function()
      require("scrollview").setup({
        excluded_filetypes = { "nerdtree", "help" },
        current_only = true,
        winblend = 75,
        base = "buffer",
        column = 120,
        signs_on_startup = { "all" },
        diagnostics_severities = { vim.diagnostic.severity.ERROR },
      })
      require("scrollview.contrib.gitsigns").setup()
    end,
  },
  {
    "3rd/image.nvim",
    config = function()
      require("image").setup({
        backend = "ueberzug",
      })
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    opts = {
      hint = "floating-big-letter",
      show_prompt = false,
    },
    keys = {
      {
        "<leader>wp",
        function()
          local picked_window_id = require("window-picker").pick_window()
          vim.api.nvim_set_current_win(picked_window_id)
        end,
      },
    },
    config = function(_, opts)
      require("window-picker").setup(opts)
    end,
  },
}
