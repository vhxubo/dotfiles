return {
  { "nvim-treesitter/playground" },
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
}
