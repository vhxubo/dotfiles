return {
  { "h-hg/fcitx.nvim" },
  { "wakatime/vim-wakatime" },
  {
    "abecodes/tabout.nvim",
    event = "InsertEnter",
    config = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
    },
  },
  { "ThePrimeagen/vim-be-good" },
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
    "Wansmer/treesj",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        "gS",
        ':lua require("treesj").toggle()<cr>',
        desc = "toggle node under cursor",
      },
    },
    opts = {
      use_default_keymaps = false,
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("ufo").setup({
        provider_selector = function()
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
  {
    "gelguy/wilder.nvim",
    config = function()
      local wilder = require("wilder")
      wilder.setup({ modes = { ":" } })
      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer({
          pumblend = 20,
          min_width = "100%", -- minimum height of the popupmenu, can also be a number
          min_height = "50%", -- to set a fixed height, set max_height to the same value
          reverse = 0, -- if 1, shows the candidates from bottom to top
        })
      )
    end,
  },
  {
    "eandrju/cellular-automaton.nvim",
    keys = {
      {
        "<leader>fml",
        "<cmd>CellularAutomaton make_it_rain<CR>",
      },
    },
  },
}
