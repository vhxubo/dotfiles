return {
  { "mg979/vim-visual-multi" },
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
    "junegunn/vim-easy-align",
    config = function()
      vim.cmd([[
        " Start interactive EasyAlign in visual mode (e.g. vipga)
        xmap gn <Plug>(EasyAlign)
        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap gn <Plug>(EasyAlign)
      ]])
    end,
  },
}
