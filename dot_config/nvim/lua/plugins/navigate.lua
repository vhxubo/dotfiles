return {
  { "christoomey/vim-tmux-navigator", event = "BufReadPre" },
  { "nacro90/numb.nvim", config = true },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      {
        "w",
        "<cmd>lua require('spider').motion('w')<CR>",
        desc = "Spider-w",
      },
      {
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        desc = "Spider-e",
      },
      {
        "b",
        "<cmd>lua require('spider').motion('b')<CR>",
        desc = "Spider-b",
      },
      {
        "ge",
        "<cmd>lua require('spider').motion('ge')<CR>",
        desc = "Spider-ge",
      },
    },
  },
}
