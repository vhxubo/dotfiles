return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "vue", "css", "scss" })
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "vue-language-server",
        "emmet-language-server",
        "css-lsp",
        "tailwindcss-language-server",
        "typescript-language-server",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_language_server = {
          filetypes = {
            "css",
            "html",
            "javascript",
            "javascriptreact",
            "less",
            "sass",
            "scss",
            "typescriptreact",
            "vue",
          },
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sources, {
        name = "html-css",
        option = {
          max_count = 3,
          enable_on = {
            "html",
            "vue",
          },
          file_extensions = { "css", "sass", "less" },
          style_sheets = {
            "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
          },
        },
      })
    end,
  },
  {
    "Jezda1337/nvim-html-css",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    config = function()
      require("html-css"):setup()
    end,
  },
  {
    "axelvc/template-string.nvim",
    event = "InsertEnter",
    config = true,
  },
}
