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
}
