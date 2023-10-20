return {
  -- { "ellisonleao/gruvbox.nvim" },
  -- { "vhxubo/molokai" },
  -- {
  --   "olimorris/onedarkpro.nvim",
  --   priority = 1000, -- Ensure it loads first
  -- },
  -- { "EdenEast/nightfox.nvim" },
  { "rebelot/kanagawa.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      -- colorscheme = "molokai",
      -- colorscheme = "catppuccin",
      -- colorscheme = "onedark",
      -- colorscheme = "onedark_dark",
      -- colorscheme = "nightfox",
      colorscheme = "kanagawa",
    },
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        mode = "foreground", -- Set the display mode.
      })
    end,
  },
  {
    "dstein64/nvim-scrollview",
    config = function()
      require("scrollview").setup({
        excluded_filetypes = { "nerdtree" },
        current_only = true,
        winblend = 75,
        base = "buffer",
        column = 80,
        signs_on_startup = { "all" },
        diagnostics_severities = { vim.diagnostic.severity.ERROR },
      })
      require("scrollview.contrib.gitsigns").setup()
    end,
  },
}
