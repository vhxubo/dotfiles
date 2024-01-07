return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    init = function() end,
  },
  {
    "lukas-reineke/headlines.nvim",
    enabled = false,
  },
  {
    "catppuccin",
    enabled = false,
  },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        search = {
          enabled = false,
        },
        char = {
          enabled = false,
        },
      },
    },
    keys = {
      { "S", false, mode = { "n", "x", "o" } },
      {
        "<CR>",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
  {
    "echasnovski/mini.surround",
    enabled = false,
  },
  {
    "echasnovski/mini.ai",
    enabled = false,
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      options = {
        -- imporve html indent, not move to start char
        indent_at_cursor = false,
      },
    },
  },
  {
    "stevearc/aerial.nvim",
    opts = {
      layout = {
        width = 30,
      },
      -- A list of all symbols to display. Set to false to display all symbols.
      -- This can be a filetype map (see :help aerial-filetype-map)
      -- To see all available values, see :help SymbolKind
      filter_kind = {
        "Class",
        "Constructor",
        "Method",
        "Function",
        "Object",
        "Constant",
        "Variable",
      },
    },
  },
  {
    "lualine.nvim",
    opts = {
      options = {
        -- component_separators = { left = "", right = "" },
        -- component_separators = { left = "»", right = "«" },
        component_separators = { left = "»", right = "" },
        section_separators = { left = "", right = "" },
      },
    },
  },
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
          return false
        end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
      end
      local check_backspace = function()
        local col = vim.fn.col(".") - 1

        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() and has_words_before() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            -- fallback()
            require("neotab").tabout()
          else
            require("neotab").tabout()
            -- fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
