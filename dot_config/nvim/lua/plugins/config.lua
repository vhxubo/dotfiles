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
    "nvim-neo-tree/neo-tree.nvim",
    init = function() end,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").load({ paths = "./snippets" })
    end,
  },
}
