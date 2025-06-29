return {
  -- filename
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      require("incline").setup({
        render = function(props)
          local bufname = vim.api.nvim_buf_get_name(props.buf)
          local filename = vim.fn.fnamemodify(bufname, ":p:h:t") .. "/" .. vim.fn.fnamemodify(bufname, ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
        window = {
          placement = {
            vertical = "bottom",
            horizontal = "right",
          },
        },
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
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("onedark").setup({
        toggle_style_key = "<leader>ts",
        -- transparent = true,
        -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        style = "cool",
      })
      -- Enble theme
      require("onedark").load()
    end,
  },
  {
    "tamton-aquib/duck.nvim",
    config = function()
      vim.keymap.set("n", "<leader>dd", function()
        require("duck").hatch()
      end, {})
      vim.keymap.set("n", "<leader>dk", function()
        require("duck").cook()
      end, {})
      vim.keymap.set("n", "<leader>da", function()
        require("duck").cook_all()
      end, {})
    end,
  },
  {
    "mvllow/modes.nvim",
    tag = "v0.2.1",
    config = function()
      require("modes").setup()
    end,
  },
  -- {
  --   "uga-rosa/ccc.nvim",
  --   opts = {
  --     highlighter = {
  --       auto_enable = true,
  --     },
  --   },
  -- },
}
