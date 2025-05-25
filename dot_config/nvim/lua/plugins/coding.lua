return {
  -- gau gaU
  { "johmsalas/text-case.nvim", config = true },
  -- very useful for IME change
  {
    "keaising/im-select.nvim",
    config = function()
      require("im_select").setup({})
    end,
  },
  {
    "rareitems/printer.nvim",
    event = "BufEnter",
    config = function()
      require("printer").setup({
        keymap = "gl",
        formatters = {
          vue = function(text_inside, text_var)
            return string.format('console.log("%s = ", %s)', text_inside, text_var)
          end,
          lua = function(text_inside, text_var)
            return string.format("print(vim.inspect(%s) .. [[%s]])", text_var, text_inside)
          end,
          javascriptreact = function(text_inside, text_var)
            return string.format('console.log("%s = ", %s)', text_inside, text_var)
          end,
          typescriptreact = function(text_inside, text_var)
            return string.format('console.log("%s = ", %s)', text_inside, text_var)
          end,
        },
      })
      vim.keymap.set("n", "gL", "<Plug>(printer_print)iw")
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        keymaps = {
          insert = "<C-g>s",
          normal = "gs",
          normal_cur = "gS",
          normal_line = "gsgs",
          normal_cur_line = "gSgS",
          visual = "gz",
          visual_line = "gZ",
          delete = "gsd",
          change = "gsr",
        },
      })
    end,
  },
}
