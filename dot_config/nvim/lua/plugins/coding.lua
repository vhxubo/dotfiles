return {
  { "mg979/vim-visual-multi" },
  { "johmsalas/text-case.nvim", config = true },
  { "tpope/vim-repeat" },
  -- Readline style insertion
  { "tpope/vim-rsi" },
  -- [<space> and ]<space> for insert space in normal mode
  { "tpope/vim-unimpaired" },
  -- corrent dst function, better than nvim-surround
  -- keymapbing better than mini.surround
  -- yss wrap the entire line
  -- ys[text_object]
  { "tpope/vim-surround" },
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

  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- Better increase/descrease
  {
    "monaqa/dial.nvim",
    keys = {
      {
        "<C-a>",
        function()
          return require("dial.map").inc_normal()
        end,
        expr = true,
        desc = "Increment",
      },
      {
        "<C-x>",
        function()
          return require("dial.map").dec_normal()
        end,
        expr = true,
        desc = "Decrement",
      },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new({ elements = { "let", "const" } }),
          augend.constant.new({
            elements = { "&&", "||" },
            word = false,
            cyclic = true,
          }),
          augend.constant.new({
            elements = { "==", "!=" },
            word = false,
            cyclic = true,
          }),
        },
      })
    end,
  },
  {
    "potamides/pantran.nvim",
    config = function()
      local pantran = require("pantran")
      pantran.setup({
        default_engine = "google",
      })
      vim.keymap.set({ "n", "x" }, "<leader>tt", function()
        vim.cmd("Pantran")
        vim.cmd("startinsert")
      end, { desc = "Translate typing to English" })
      vim.keymap.set({ "n", "x" }, "<leader>tj", function()
        return pantran.motion_translate({
          target = "zh-CN",
        })
      end, { noremap = true, silent = true, expr = true, desc = "Translate to Chinese" })
      vim.keymap.set(
        { "n", "x" },
        "<leader>tr",
        pantran.motion_translate,
        { noremap = true, silent = true, expr = true, desc = "Translate to English" }
      )
    end,
  },
  {
    "mizlan/iswap.nvim",
    config = function()
      require("iswap").setup()
      vim.keymap.set({ "n", "x" }, "<Leader>i", "<cmd>ISwapNode<cr>", { noremap = true })
    end,
  },
  {
    "Wansmer/treesj",
    keys = {
      { "<leader>j", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
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
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
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
  -- dsf, dsF
  { "Matt-A-Bennett/vim-surround-funk", dependencies = { "kana/vim-textobj-user" } },
}
