return {
  { "rebelot/kanagawa.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "kanagawa-lotus",
      colorscheme = "kanagawa",
    },
  },
  {

    "lewis6991/satellite.nvim",
    config = true,
  },
  {
    "3rd/image.nvim",
    config = function()
      require("image").setup({
        backend = "ueberzug",
      })
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
  -- filename
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      require("incline").setup({
        hide = {
          cursorline = true,
        },
        render = function(props)
          local bufname = vim.api.nvim_buf_get_name(props.buf)
          local filename = vim.fn.fnamemodify(bufname, ":p:h:t") .. "/" .. vim.fn.fnamemodify(bufname, ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        alacritty = {
          enabled = true,
          font = "22",
        },
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
          -- you may turn on/off statusline in zen mode by setting 'laststatus'
          -- statusline will be shown only if 'laststatus' == 3
          laststatus = 0, -- turn off the statusline in zen mode
        },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
  -- https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=vhxubo
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
██╗   ██╗██╗  ██╗██╗  ██╗██╗   ██╗██████╗  ██████╗ 
██║   ██║██║  ██║╚██╗██╔╝██║   ██║██╔══██╗██╔═══██╗
██║   ██║███████║ ╚███╔╝ ██║   ██║██████╔╝██║   ██║
╚██╗ ██╔╝██╔══██║ ██╔██╗ ██║   ██║██╔══██╗██║   ██║
 ╚████╔╝ ██║  ██║██╔╝ ██╗╚██████╔╝██████╔╝╚██████╔╝
  ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝ 
      ]]

      logo = string.rep("\n", 6) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
