return {
  { "nvim-treesitter/playground", event = "VeryLazy" },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
      {
        "andersevenrud/nvim_context_vt",
        opts = { -- How many lines required after starting position to show virtual text
          -- Default: 1 (equals two lines total)
          min_rows = 3,
        },
      },
      "HiPhish/rainbow-delimiters.nvim",
    },
    opts = {
      endwise = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["ax"] = "@call.outer",
            ["ix"] = "@call.inner",
          },
          include_surrounding_whitespace = true,
        },
        move = {
          goto_next_start = {
            ["]x"] = "@call.*",
            ["]a"] = "@parameter.*",
          },
          goto_next_end = {
            ["]X"] = "@call.*",
            ["]A"] = "@parameter.*",
          },
          goto_previous_start = {
            ["[x"] = "@call.*",
            ["[a"] = "@parameter.*",
          },
          goto_previous_end = {
            ["[X"] = "@call.*",
            ["[A"] = "@parameter.*",
          },
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-calc",
      "lukas-reineke/cmp-rg",
    },
    opts = function(_, opts)
      vim.list_extend(opts.sources, { { name = "rg", max_item_count = 3 }, { name = "calc" } })
    end,
  },
}
