return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").load({ paths = "./snippets" })
      local postfix = require("luasnip.extras.postfix").postfix
      local ls = require("luasnip")
      local f = ls.function_node

      ls.add_snippets("all", {
        postfix(".log", {
          f(function(_, parent)
            return "console.log(" .. parent.snippet.env.POSTFIX_MATCH .. ")"
          end, {}),
        }),
      })
      ls.add_snippets("vue", {
        postfix(".vf", {
          f(function(_, parent)
            return 'v-for="(item, index) in ' .. parent.snippet.env.POSTFIX_MATCH .. '" :key="index"'
          end, {}),
        }),
        postfix(".vfb", {
          f(function(_, parent)
            return 'v-for="(item, index) in ' .. parent.snippet.env.POSTFIX_MATCH .. '" :key="index" v-bind="item" '
          end, {}),
        }),
        postfix(".vfo", {
          f(function(_, parent)
            return 'v-for="(item, index) in '
              .. parent.snippet.env.POSTFIX_MATCH
              .. '" :key="index" :label="item.label" :value="item.value" '
          end, {}),
        }),
      })
    end,
  },
}
