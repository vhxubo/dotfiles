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
}
