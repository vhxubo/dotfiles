-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

-- copy file path
vim.keymap.set(
  "n",
  "<leader>yl",
  ':let @+=fnamemodify(expand("%:f"), ":~:.") . ":" . line(".")<CR>',
  { silent = true, desc = "Copy Relative Path with Line Number" }
)
vim.keymap.set(
  "n",
  "<leader>yf",
  ':let @+=fnamemodify(expand("%:f"), ":f")<CR>',
  { silent = true, desc = "Copy Relative Path" }
)
vim.keymap.set(
  "n",
  "<leader>yr",
  ':let @+=fnamemodify(expand("%:f"), ":r:s?src?@?")<CR>',
  { silent = true, desc = "Copy Relative Path For Code" }
)

-- split all buffer
vim.keymap.set({ "n", "i", "v" }, "<C-w>a", "<cmd>sba<cr>", opts)
vim.keymap.set({ "n", "i", "v" }, "<C-w>A", "<cmd>vert sba<cr>", opts)

-- the best register map
-- replace selected but save the clipboard
vim.keymap.set("x", "<leader>P", [["_dP]], { desc = "Replace selected but save the clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delecte to blck hole" })
