return {
  { "mg979/vim-visual-multi" },
  { "johmsalas/text-case.nvim", config = true },
  {
    "keaising/im-select.nvim",
    config = function()
        require("im_select").setup({})
    end,
  },
  { "tpope/vim-repeat" },
  -- Readline style insertion
  { "tpope/vim-rsi" },
  -- [<space> and ]<space> for insert space in normal mode
  { "tpope/vim-unimpaired" },
  -- cx exchange two motion
  { "tommcdo/vim-exchange" },
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
  -- daA, diA
  -- * style="color: red; |background: red"
  -- daa, dia
  -- * const {code, |result} = resp
  -- da<space>, di<space>
  -- * class="btn |btn-primary"
  {
    "wellle/targets.vim",
    config = function()
      -- https://github.com/wellle/targets.vim/issues/254#issuecomment-671852202
      vim.cmd([[
        autocmd User targets#mappings#user call targets#mappings#extend({
          \ 'a': {'argument': [{'o': '[{([]', 'c': '[])}]', 's': '[,;]'}]},
          \ 'A': {'argument': [{'o': '["]', 'c': '["]', 's': '[;]'}]},
          \ ' ': {'separator': [{'d': ' '}]},
          \ })
      ]])
    end,
  },
  -- dav, div
  { "Julian/vim-textobj-variable-segment", dependencies = { "kana/vim-textobj-user" } },
  -- dae, die
  { "kana/vim-textobj-entire", dependencies = { "kana/vim-textobj-user" } },
  -- dal, dil
  { "kana/vim-textobj-line", dependencies = { "kana/vim-textobj-user" } },
  -- vac, vic
  { "idbrii/textobj-word-column.vim", dependencies = { "kana/vim-textobj-user" } },
}
