-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>sl", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
-- https://vimtricks.com/p/get-the-current-file-path/
vim.keymap.set("n", "<leader>yc", ':let @+=fnamemodify(expand("%:f"), ":~:.") . ":" . line(".")<CR>')
