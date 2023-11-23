return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      -- vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_forground = "material"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_statusline_style = "material"
      vim.g.gruvbox_material_better_performance = 1
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  -- reduce notify timeout
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 1000,
    },
  },
  -- filter some notify, and some msg_show split to view
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "method textDocument/signatureHelp is not supported by any of the servers registered for the current buffer",
        },
        opts = { skip = true },
      })
      -- always route any messages with more than 20 lines to the split view
      table.insert(opts.routes, {
        view = "split",
        filter = { event = "msg_show", min_height = 20 },
      })
    end,
  },
  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
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
