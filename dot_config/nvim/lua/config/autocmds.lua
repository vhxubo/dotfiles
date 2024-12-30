-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- auto mark vue setup import return
-- require("vhxubo/auto-mark")

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "json", "jsonc", "markdown" },
--   callback = function()
--     vim.opt.conceallevel = 0
--     vim.opt.wrap = false
--   end,
-- })

-- support gf for vue project
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "vue", "javascript" },
  callback = function()
    vim.cmd([[
    setlocal isfname+=@-@
    setlocal includeexpr=substitute(v:fname,'^@\/','src/','')
    setlocal suffixesadd=.js,.vue,.scss,.css
    ]])
  end,
})
