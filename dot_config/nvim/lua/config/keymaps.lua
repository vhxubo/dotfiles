-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

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

-- split all buffer
vim.keymap.set({ "n", "i", "v" }, "<C-w>a", "<cmd>sba<cr>", opts)
vim.keymap.set({ "n", "i", "v" }, "<C-w>A", "<cmd>vert sba<cr>", opts)

-- the best register map
-- replace selected but save the clipboard
vim.keymap.set("x", "<leader>P", [["_dP]], { desc = "Replace selected but save the clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delecte to blck hole" })

vim.keymap.set("x", "<leader>n", ":normal ", { desc = "Normal quickly" })
