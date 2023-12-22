return {
  { "nvim-treesitter/playground", event = "VeryLazy" },
  {
    "chrisgrieser/nvim-various-textobjs",
    lazy = false,
    opts = { useDefaultKeymaps = true },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
      "andersevenrud/nvim_context_vt",
    },
    opts = {
      endwise = {
        enable = true,
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
