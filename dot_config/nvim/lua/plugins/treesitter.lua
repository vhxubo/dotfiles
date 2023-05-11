return {
  {
    "windwp/nvim-ts-autotag",
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "fish",
        "vue",
        "css",
        "scss",
        "javascript",
      })
    end,
  },
}
