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
    dependencies = {
      {
        "nvim-telescope/telescope-file-browser.nvim",
        keys = {
          {
            "<leader>;",
            function()
              local telescope = require("telescope")

              local function telescope_buffer_dir()
                return vim.fn.expand("%:p:h")
              end

              telescope.extensions.file_browser.file_browser({
                path = "%:p:h",
                cwd = telescope_buffer_dir(),
              })
            end,
            desc = "Open File Browser with the path of the current buffer",
          },
        },
      },
    },
    init = function()
      if vim.fn.argc(-1) == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
          })
        end
      end
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

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
      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          layout_config = {
            height = 25,
          },
          hijack_netrw = true,
          mappings = {
            ["n"] = {
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["l"] = actions.select_tab,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
            },
          },
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("file_browser")
    end,
  },
  {
    "piersolenski/telescope-import.nvim",
    keys = {
      {
        "<leader>si",
        ":Telescope import<cr>",
        desc = "Search imports",
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
      },
      {
        "<leader>R",
        "<Cmd>Telescope frecency workspace=CWD<CR>",
      },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          frecency = {
            -- ignore_patterns = {},
            workspaces = {
              ["nvim"] = "/home/vhxubo/.config/nvim",
            },
          },
        },
      })
      require("telescope").load_extension("frecency")
    end,
  },
}
