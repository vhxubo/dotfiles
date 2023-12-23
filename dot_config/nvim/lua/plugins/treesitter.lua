return {
  { "nvim-treesitter/playground", event = "VeryLazy" },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
      "andersevenrud/nvim_context_vt",
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
    dependencies = { "ray-x/cmp-treesitter" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "treesitter" })
    end,
  },
}
