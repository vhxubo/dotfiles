return {
  { "h-hg/fcitx.nvim" },
  { "wakatime/vim-wakatime" },
  {
    "LunarVim/bigfile.nvim",
    config = function()
      require("bigfile").setup({
        filesize = 2, -- size of the file in MiB, the plugin round file sizes to the closest MiB
        pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
        features = { -- features to disable
          "indent_blankline",
          "illuminate",
          "lsp",
          "treesitter",
          "syntax",
          "matchparen",
          "vimopts",
          "filetype",
        },
      })
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
  },
  {
    "mg979/vim-visual-multi",
    config = function() end,
  },
  { "NeogitOrg/neogit", dependencies = "nvim-lua/plenary.nvim", config = true },
  { "sindrets/diffview.nvim", config = true },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit",
          "gitrebase",
          "svn",
          "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "johmsalas/text-case.nvim",
    config = function()
      require("textcase").setup({})
    end,
  },
}
