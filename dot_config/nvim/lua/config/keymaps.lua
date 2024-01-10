-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

require("vhxubo.setup-insert").setup()

-- copy file path
vim.keymap.set(
  "n",
  "<leader>yl",
  ':let @+=fnamemodify(expand("%:f"), ":~:.") . ":" . line(".")<CR>',
  { silent = true, desc = "Copy relative path with line number" }
)
vim.keymap.set(
  "n",
  "<leader>yf",
  ':let @+=fnamemodify(expand("%:f"), ":f")<CR>',
  { silent = true, desc = "Copy relative path" }
)
vim.keymap.set(
  "n",
  "<leader>yr",
  ':let @+=fnamemodify(expand("%:f"), ":r:s?src?@?")<CR>',
  { silent = true, desc = "Copy relative path for code" }
)
vim.keymap.set("x", "<leader>yi", function()
  vim.cmd([[norm! "+y]])
  local selection = vim.fn.getreg("+")
  vim.fn.setreg("i", selection)
  local path = vim.fn.fnamemodify(vim.fn.expand("%:f"), ":r:s?src?@?")
  local result = "import { " .. selection .. " } from '" .. path .. "'"
  vim.fn.setreg("+", result)
end, { silent = true, desc = "Copy relative path and import selection" })
vim.keymap.set("n", "<leader>yi", function()
  local filename = vim.fn.fnamemodify(vim.fn.expand("%:f"), ":t:r")
  local path = vim.fn.fnamemodify(vim.fn.expand("%:f"), ":r:s?src?@?")
  local result = "import " .. filename .. " from '" .. path .. "'"
  vim.fn.setreg("+", result)
end, { silent = true, desc = "Copy relative path with import" })

-- the best register map
-- replace selected but save the clipboard
vim.keymap.set("x", "<leader>P", [["_dP]], { desc = "Replace selected but save the clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delecte to blck hole" })
-- https://vim.fandom.com/wiki/Power_of_g
-- the best map for FrontEnd developer
vim.keymap.set(
  { "n", "v" },
  "<leader>Dl",
  [[:g/console.log/exe 'normal! "_dd'<cr>]],
  { silent = true, desc = "Delecte file console.log" }
)
vim.keymap.set(
  { "n", "v" },
  "<leader>Df",
  [[:call delete(expand('%')) | bdelete!<cr>]],
  { silent = true, desc = "Delecte current file and buffer" }
)

vim.keymap.set("x", "<leader>n", ":normal ", { desc = "Normal quickly" })

vim.keymap.set("i", "jk", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("i", "<C-k>", '<C-o>"_d$')
vim.keymap.set("i", "<C-f>", "<right>")
vim.keymap.set("i", "<C-b>", "<left>")

vim.keymap.set("n", "<BS>", ":nohlsearch<cr>", { noremap = true, silent = true, desc = "No highlight search" })
vim.keymap.set("n", "H", "0^", { noremap = true })
vim.keymap.set("n", "L", "$", { noremap = true })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>wo", "<C-W>o", { desc = "Delete all other windows" })
vim.keymap.set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close all other tabs" })
