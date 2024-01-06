return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "f3fora/cmp-spell" },
    opts = function(_, opts)
      vim.list_extend(opts.sources, { { name = "spell" } })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "cspell" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- Use the "*" filetype to run formatters on all filetypes.
        ["*"] = { "cspell" },
      },
    },
  },
}
