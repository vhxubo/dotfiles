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
}
