return {
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          local telescope = require("telescope")
          local lga_actions = require("telescope-live-grep-args.actions")
          telescope.setup({
            extensions = {
              live_grep_args = {
                mappings = {
                  i = {
                    ["<C-k>"] = lga_actions.quote_prompt({ postfix = " --fixed-strings" }),
                    ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                  },
                },
              },
            },
          })
          require("telescope").load_extension("live_grep_args")
        end,
        keys = {
          {
            "<leader>/",
            ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
            desc = "Live Grep Args",
          },
        },
      },
    },
  },
  {
    "telescope.nvim",
    keys = {
      {
        "<leader>'",
        function()
          local themes = require("telescope.themes")
          require("telescope.builtin").find_files(themes.get_ivy({
            cwd = vim.fn.expand("%:p:h"),
            layout_config = { prompt_position = "bottom", height = 0.8 },
            initial_mode = "normal",
          }))
        end,
        desc = "List files(cwd)",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        file_ignore_patterns = { "public" },
        winblend = 0,
        mappings = {
          i = {
            ["<C-CR>"] = actions.select_tab,
          },
        },
      })
      telescope.setup(opts)
    end,
  },
  {
    "piersolenski/telescope-import.nvim",
    keys = {
      {
        "<leader>si",
        ":Telescope import<cr>",
        desc = "Search and insert imports",
      },
    },
    config = function()
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")
      require("telescope").setup({
        extensions = {
          import = {
            custom_languages = {
              {
                regex = [[^(?:import(?:[\"'\s]*([\w*{}\n, ]+)from\s*)?[\"'\s](.*?)[\"'\s].*)]],
                filetypes = { "vue" },
                extensions = { "js", "ts" },
              },
            },
            attach_mappings = function(prompt_bufnr, _)
              actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local origin_position = vim.fn.getpos(".")
                -- use with vhxubo/auto-mark.lua
                local import_position = vim.fn.getpos("'i")
                if import_position[2] ~= 0 then
                  vim.fn.setpos(".", import_position)
                end
                vim.api.nvim_put({ selection.value }, "l", true, false)
                vim.fn.setpos(".", origin_position)
              end)
              return true
            end,
          },
        },
      })
      require("telescope").load_extension("import")
    end,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    keys = {
      {
        "<leader>r",
        "<Cmd>Telescope frecency<CR>",
        desc = "Frequency files",
      },
      {
        "<leader>;",
        "<Cmd>Telescope frecency workspace=CWD<CR>",
        desc = "Frequency files(cwd)",
      },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          frecency = {
            workspaces = {
              ["nvim"] = "/home/vhxubo/.config/nvim",
            },
          },
        },
      })
      require("telescope").load_extension("frecency")
    end,
  },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    keys = {
      {
        "<leader>fu",
        "<cmd>Telescope undo<cr>",
        desc = "undo history",
      },
    },
    opts = {
      extensions = {
        undo = {},
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("undo")
    end,
  },
}
