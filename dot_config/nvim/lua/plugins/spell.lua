return {
  {
    "kamykn/spelunker.vim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.api.nvim_set_hl(0, "SpelunkerSpellBad", { underdotted = 1 })
      vim.api.nvim_set_hl(0, "SpelunkerComplexOrCompoundWord", { underdotted = 1 })
      -- ZT: Toggle to enable or disable.
      -- Zt: Toggle to enable or disable only the current buffer.
      vim.g.enable_spelunker_vim = 0
      vim.g.spelunker_check_type = 2
    end,
  },
}
