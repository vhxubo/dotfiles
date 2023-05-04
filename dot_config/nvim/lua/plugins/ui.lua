return {
  { "ellisonleao/gruvbox.nvim" },
  { "sickill/vim-monokai" },
  { "vhxubo/molokai" },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      -- colorscheme = "monokai",
      colorscheme = "molokai",
    },
  },
  {
    "folke/zen-mode.nvim",
    config = true,
  },
  { "m-demare/hlargs.nvim", config = true },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "fish",
        "vue",
        "css",
        "scss",
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
}
