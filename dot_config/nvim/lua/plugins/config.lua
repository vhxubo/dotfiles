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
    "echasnovski/mini.surround",
    opts = {
      custom_surroundings = {
        t = {
          input = {
            "<([%p%w]-)%f[^<%w][^<>]->.-</%1>",
            "^<.->().*()</[^/]->$",
          },
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
  {
    "echasnovski/mini.hipatterns",
    -- https://github.com/echasnovski/mini.nvim/discussions/1024
    opts = function(_, opts)
      -- Returns hex color group for matching short hex color.
      local hipatterns = require("mini.hipatterns")
      --
      ---@param match string
      ---@return string
      local hex_color_short = function(_, match)
        local style = "bg" -- 'fg' or 'bg', for extmark_opts_inline use 'fg'
        local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
        local hex = string.format("#%s%s%s%s%s%s", r, r, g, g, b, b)
        return hipatterns.compute_hex_color_group(hex, style)
      end

      -- Returns hex color group for matching rgb() color.
      --
      ---@param match string
      ---@return string
      local rgb_color = function(_, match)
        local style = "bg" -- 'fg' or 'bg', for extmark_opts_inline use 'fg'
        local red, green, blue = match:match("rgb%((%d+), ?(%d+), ?(%d+)%)")
        local hex = string.format("#%02x%02x%02x", red, green, blue)
        return hipatterns.compute_hex_color_group(hex, style)
      end

      -- Returns hex color group for matching rgba() color
      -- or false if alpha is nil or out of range.
      -- The use of the alpha value refers to a black background.
      --
      ---@param match string
      ---@return string|false
      local rgba_color = function(_, match)
        local style = "bg" -- 'fg' or 'bg', for extmark_opts_inline use 'fg'
        local red, green, blue, alpha = match:match("rgba%((%d+), ?(%d+), ?(%d+), ?(%d*%.?%d*)%)")
        alpha = tonumber(alpha)
        if alpha == nil or alpha < 0 or alpha > 1 then
          return false
        end
        local hex = string.format("#%02x%02x%02x", red * alpha, green * alpha, blue * alpha)
        return hipatterns.compute_hex_color_group(hex, style)
      end
      local highlighters = {
        -- `#rgb`
        hex_color_short = { pattern = "#%x%x%x%f[%X]", group = hex_color_short },
        -- `rgb(255, 255, 255)`
        rgb_color = { pattern = "rgb%(%d+, ?%d+, ?%d+%)", group = rgb_color },
        -- `rgba(255, 255, 255, 0.5)`
        rgba_color = {
          pattern = "rgba%(%d+, ?%d+, ?%d+, ?%d*%.?%d*%)",
          group = rgba_color,
        },
      }
      for _, v in pairs(highlighters) do
        table.insert(opts.highlighters, v)
      end
    end,
  },
}
