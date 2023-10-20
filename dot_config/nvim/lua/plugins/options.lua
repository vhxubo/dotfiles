return {
  {
    "mini.hipatterns",
    opts = {
      highlighters = {
        hardcode = { pattern = "%f[%w]()hard code()%f[%W]", group = "MiniHipatternsHack" },
      },
    },
  },
  {
    "aerial.nvim",
    opts = {
      -- A list of all symbols to display. Set to false to display all symbols.
      -- This can be a filetype map (see :help aerial-filetype-map)
      -- To see all available values, see :help SymbolKind
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
        "Variable",
      },
    },
  },
  {
    "echasnovski/mini.ai",
    opts = function()
      return {
        custom_textobjects = {
          t = { "<([%w%-]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
        },
      }
    end,
  },
}
