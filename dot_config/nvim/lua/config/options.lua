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

if vim.g.neovide == true then
    -- disabled all animation
    vim.g.neovide_position_animation_length = 0
    vim.g.neovide_cursor_animation_length = 0.00
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_cursor_animate_in_insert_mode = false
    vim.g.neovide_cursor_animate_command_line = false
    vim.g.neovide_scroll_animation_far_lines = 0

    vim.o.guifont = "Maple Mono NF CN:h14" -- text below applies for VimScript
    vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end

-- vim.g.snacks_animate = true 

if vim.g.neovide then
    vim.keymap.set('n', '<C-s>', ':w<CR>') -- Save
    vim.keymap.set('v', '<C-c>', '"+y') -- Copy
    vim.keymap.set('n', '<C-v>', '"+P') -- Paste normal mode
    vim.keymap.set('v', '<C-v>', '"+P') -- Paste visual mode
    vim.keymap.set('c', '<C-v>', '<C-R>+') -- Paste command mode
    vim.keymap.set('i', '<C-v>', '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<C-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<C-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-v>', '<C-R>+', { noremap = true, silent = true})
