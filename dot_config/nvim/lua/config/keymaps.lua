-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>yc", ':let @+=fnamemodify(expand("%:f"), ":~:.") . ":" . line(".")<CR>', opts)
map({ "x", "n" }, "<C-i>", "<cmd>w<cr><esc>", opts)
