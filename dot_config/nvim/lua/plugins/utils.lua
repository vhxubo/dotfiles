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
    "skywind3000/asyncrun.vim",
    config = function()
      vim.g.asyncrun_open = 6
      vim.cmd([[
        cnoreabbrev Ar AsyncRun
        cnoreabbrev AR AsyncRun
        cnoreabbrev As AsyncStop
        cnoreabbrev AS AsyncStop
      ]])
    end,
  },
  {
    "skywind3000/asynctasks.vim",
    config = function()
      vim.g.asynctasks_extra_config = { "~/.config/nvim/extra/tasks.ini" }
      vim.g.asynctasks_term_pos = "tab"
      vim.cmd([[
        cnoreabbrev At AsyncTask
        cnoreabbrev AT AsyncTask
      ]])
    end,
  },
  {
    "max397574/better-escape.nvim",
    config = true,
  },
}
