return {
  { "h-hg/fcitx.nvim" },
  { "wakatime/vim-wakatime" },
  { "christoomey/vim-tmux-navigator" },
  {
    "mg979/vim-visual-multi",
    config = function() end,
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
    },
    ft = { "fugitive" },
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
