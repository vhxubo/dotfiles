return {
  { "mg979/vim-visual-multi" },
  { "johmsalas/text-case.nvim", config = true },
  { "tpope/vim-rsi" },
  { "tpope/vim-unimpaired" },
  {
    "rareitems/printer.nvim",
    config = function()
      require("printer").setup({
        keymap = "gl",
        formatters = {
          vue = function(text_inside, text_var)
            return string.format('console.log("%s = ", %s)', text_inside, text_var)
          end,
        },
      })
    end,
  },

  -- Create annotations with one keybind, and jump your cursor in the inserted annotation
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>cc",
        function()
          require("neogen").generate({})
        end,
        desc = "Neogen Comment",
      },
    },
    opts = { snippet_engine = "luasnip" },
  },

  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- Refactoring tool
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor()
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
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
      { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
  {
    "echasnovski/mini.align",
    opts = {
      mappings = {
        start = "gn",
        start_with_preview = "gN",
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
}
