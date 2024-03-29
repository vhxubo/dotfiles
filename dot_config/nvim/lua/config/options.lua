-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.foldcolumn = "1" -- '0' is not bad
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.opt.wrap = true
vim.opt.linebreak = true
-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
-- -- Default splitting will cause your main splits to jump when opening an edgebar.
-- -- To prevent this, set `splitkeep` to either `screen` or `topline`.
vim.opt.splitkeep = "screen"

vim.opt.spell = true
vim.opt.spelloptions = "camel"
vim.opt.spelllang = { "en_us" }

-- https://jaketrent.com/post/set-node-version-nvim/
-- required: fnm install v20.10.0
local node_bin = "/home/vhxubo/.local/share/fnm/node-versions/v20.10.0/installation/bin"
vim.cmd("let $PATH = '" .. node_bin .. ":' . $PATH")
