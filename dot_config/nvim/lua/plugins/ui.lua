return {
  { "ellisonleao/gruvbox.nvim" },
  { "vhxubo/molokai" },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      -- colorscheme = "molokai",
      -- colorscheme = "catppuccin",
      colorscheme = "onedark",
    },
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        window = {
          width = 85,
          height = 0.80,
          options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
          },
        },
      })
    end,
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
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2000,
      render = "minimal",
      stages = "static",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
}
