return {
  {
    "lualine.nvim",
    opts = {
      options = {
        component_separators = { left = "»", right = "" },
        section_separators = { left = "", right = "" },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
      filesystem = {
        hijack_netrw_behavior = "disabled",
        window = {
          mappings = {
            ["O"] = "system_open",
          },
        },
      },
      commands = {
        system_open = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          -- Windows: Without removing the file from the path, it opens in code.exe instead of explorer.exe
          local p
          local lastSlashIndex = path:match("^.+()\\[^\\]*$") -- Match the last slash and everything before it
          if lastSlashIndex then
            p = path:sub(1, lastSlashIndex - 1) -- Extract substring before the last slash
          else
            p = path -- If no slash found, return original path
          end
          vim.cmd("silent !start explorer " .. p)
        end,
      },
    },
  },
  {
    "echasnovski/mini.files",
    lazy = false,
    opts = {
      windows = {
        width_preview = 40,
      },
      options = {
        use_as_default_explorer = true,
      },
    },
  },
  {
    "mini.surround",
    opts = {
      custom_surroundings = {
        -- The `[%p%w]` is the "punctuaion+alphanumeric` part
        t = { input = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" } },
        T = {
          input = { "<(%w+)[^<>]->.-</%1>", "^<()%w+().*</()%w+()>$" },
          output = function()
            local tag_name = MiniSurround.user_input("Tag name")
            if tag_name == nil then
              return nil
            end
            return { left = tag_name, right = tag_name }
          end,
        },
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "hedyhli/outline.nvim",
    opts = {
      outline_window = {
        position = "left",
      },
      symbols = {
        filter = {
          default = { "String", exclude = true },
        },
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
    config = function()
      local harpoon = require("harpoon")
      local harpoon_extensions = require("harpoon.extensions")
      harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
      harpoon:extend(harpoon_extensions.builtins.navigate_with_number())
      harpoon:extend({
        UI_CREATE = function(cx)
          vim.keymap.set("n", "<C-v>", function()
            harpoon.ui:select_menu_item({ vsplit = true })
          end, { buffer = cx.bufnr })

          vim.keymap.set("n", "<C-s>", function()
            harpoon.ui:select_menu_item({ split = true })
          end, { buffer = cx.bufnr })

          vim.keymap.set("n", "<C-t>", function()
            harpoon.ui:select_menu_item({ tabedit = true })
          end, { buffer = cx.bufnr })
        end,
      })
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    opts = {
      theme = "hyper",
      config = {
        packages = { enable = false },
        week_header = {
          enable = true,
          concat = "Enjoy!󰒲",
        },
        shortcut = {
          {
            action = "lua LazyVim.pick.config_files()()",
            desc = "Config ",
            key = "c",
          },
          {
            action = 'lua require("persistence").load()',
            desc = "Restore Session ",
            key = "s",
          },
          {
            action = "LazyExtras",
            desc = "Lazy Extras ",
            key = "x",
          },
          {
            action = "Lazy",
            desc = "Lazy ",
            key = "l",
          },
          {
            action = function()
              vim.api.nvim_input("<cmd>qa<cr>")
            end,
            desc = "Quit ",
            key = "q",
          },
        },
        footer = function()
          return { "" }
        end,
      },
    },
  },
}
