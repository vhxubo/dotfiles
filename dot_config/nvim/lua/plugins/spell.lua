return {
  {
    "kamykn/spelunker.vim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.api.nvim_set_hl(0, "SpelunkerSpellBad", { underdotted = 1 })
      vim.api.nvim_set_hl(0, "SpelunkerComplexOrCompoundWord", { underdotted = 1 })
      vim.g.spelunker_check_type = 2
    end,
  },
}
