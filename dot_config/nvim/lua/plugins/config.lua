return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    init = function() end,
  },
  {
    "lukas-reineke/headlines.nvim",
    enabled = false,
  },
  {
    "catppuccin",
    enabled = false,
  },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        search = {
          enabled = false,
        },
        char = {
          enabled = false,
        },
      },
    },
    keys = {
      { "S", false, mode = { "n", "x", "o" } },
      {
        "<CR>",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
  {
    "echasnovski/mini.surround",
    enabled = false,
  },
  {
    "echasnovski/mini.ai",
    enabled = false,
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
    "stevearc/aerial.nvim",
    opts = {
      layout = {
        width = 30,
      },
      -- A list of all symbols to display. Set to false to display all symbols.
      -- This can be a filetype map (see :help aerial-filetype-map)
      -- To see all available values, see :help SymbolKind
      filter_kind = {
        "Class",
        "Constructor",
        "Method",
        "Function",
        "Object",
        "Constant",
        "Variable",
      },
    },
  },
}
