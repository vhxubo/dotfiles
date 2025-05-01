return {
  {
    "kawre/neotab.nvim",
    event = "InsertEnter",
    opts = {},
  },
  {
    "gelguy/wilder.nvim",
    dependencies = {
      "romgrk/fzy-lua-native",
    },
    config = function()
      local wilder = require("wilder")
      wilder.setup({ modes = { ":" } })
      -- Disable Python remote plugin
      wilder.set_option("use_python_remote_plugin", 0)

      wilder.set_option("pipeline", {
        wilder.branch(
          wilder.cmdline_pipeline({
            fuzzy = 1,
            fuzzy_filter = wilder.lua_fzy_filter(),
          }),
          wilder.vim_search_pipeline()
        ),
      })

      wilder.set_option(
        "renderer",
        wilder.renderer_mux({
          [":"] = wilder.popupmenu_renderer({
            pumblend = 20,
            min_width = "100%", -- minimum height of the popupmenu, can also be a number
            min_height = "50%", -- to set a fixed height, set max_height to the same value
            reverse = 0, -- if 1, shows the candidates from bottom to top
            highlighter = wilder.lua_fzy_highlighter(),
            left = {
              " ",
              wilder.popupmenu_devicons(),
            },
            right = {
              " ",
              wilder.popupmenu_scrollbar(),
            },
          }),
        })
      )
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    config = true,
  },
  {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup({})
      vim.keymap.set("n", "<leader>re", "<cmd>OverseerToggle<CR>", { desc = "Overseer explorer" })
      vim.keymap.set("n", "<leader>rr", "<cmd>OverseerRun<CR>", { desc = "Overseer run task" })
    end,
  },
}
