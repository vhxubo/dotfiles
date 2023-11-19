-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- copy file path
map(
  "n",
  "<leader>yc",
  ':let @+=fnamemodify(expand("%:f"), ":~:.") . ":" . line(".")<CR>',
  { silent = true, desc = "Copy Relative Path with Line Number" }
)
map("n", "<leader>yf", ':let @+=fnamemodify(expand("%:f"), ":f")<CR>', { silent = true, desc = "Copy Relative Path" })

-- split all buffer
map({ "n", "i", "v" }, "<C-w>a", "<cmd>sba<cr>", opts)
map({ "n", "i", "v" }, "<C-w>A", "<cmd>vert sba<cr>", opts)
