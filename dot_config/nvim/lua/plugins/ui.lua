return {
  { "ellisonleao/gruvbox.nvim" },
  { "vhxubo/molokai" },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      colorscheme = "molokai",
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
