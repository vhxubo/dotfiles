-- stylua: ignore
if true then return {} end

return {
  {
    "Bekaboo/dropbar.nvim",
    enable = false,
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    opts = {
      menu = {
        win_configs = {
          height = function(menu)
            return math.max(1, math.min(#menu.entries, math.ceil(vim.go.lines / 2)))
          end,
        },
      },
    },
    config = function(_, opts)
      require("dropbar").setup(opts)
      vim.keymap.set("n", "<leader>fd", require("dropbar.api").pick, { desc = "Open dropbar picker" })
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    opts = {
      hint = "floating-big-letter",
      show_prompt = false,
    },
    keys = {
      {
        "<leader>wp",
        function()
          local picked_window_id = require("window-picker").pick_window()
          vim.api.nvim_set_current_win(picked_window_id)
        end,
      },
    },
    config = function(_, opts)
      require("window-picker").setup(opts)
    end,
  },
}
