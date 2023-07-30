return {
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "vhxubo/snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  { "Exafunction/codeium.vim" },
  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
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
  {
    "rareitems/printer.nvim",
    config = function()
      require("printer").setup({
        keymap = "gp",
        formatters = {
          vue = function(text_inside, text_var)
            return string.format('console.log("%s = ", %s)', text_inside, text_var)
          end,
        },
      })
    end,
  },
}
