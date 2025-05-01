return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    init = function() end,
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      options = {
        -- imporve html indent, not move to start char
        indent_at_cursor = false,
      },
    },
  },
  {
    "lualine.nvim",
    opts = {
      options = {
        component_separators = { left = "»", right = "" },
        section_separators = { left = "", right = "" },
      },
    },
  },
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
}
