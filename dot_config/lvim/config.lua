--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldnestmax = 10
vim.opt.foldlevel = 10
vim.opt.wrap = true
vim.opt.linebreak = true

-- general
lvim.log.level = "info"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<leader><leader>"] = ":Telescope frecency<CR>"

-- lvim.builtin.which_key.vmappings["zz"] = "\"zy<cmd>Telescope grep_string default_text=<C-r>z<CR>"
local default_opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('v', '<C-f>', 'y<ESC>:Telescope grep_string default_text=<c-r>0<CR>', default_opts)

lvim.builtin.which_key.mappings["bp"] = { "<cmd>BufferLineTogglePin<CR>", "Toggle buffer pin" }
lvim.builtin.which_key.mappings["bc"] = { "<cmd>%bd<CR>", "Close all buffers" }
lvim.builtin.which_key.mappings["bo"] = { "<cmd>BufferLineCloseLeft<CR><cmd>BufferLineCloseRight<CR>",
  "Only current buffer" }
lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<CR>", "Save without formatting" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
  j = { "<cmd>lua require('trouble').next({skip_group = true, jump = true})<cr>", "Next diagnostics" },
  k = { "<cmd>lua require('trouble').previous({skip_group = true, jump = true})<cr>", "Previous diagnostics" },
}

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}
lvim.builtin.which_key.mappings["F"] = { "<cmd>Telescope file_browser<CR>", "Open file browser" }
lvim.builtin.which_key.mappings["su"] = { "<cmd>Telescope bookmarks<CR>", "Open bookmarks in browser" }
lvim.builtin.which_key.mappings["sn"] = { "<cmd>Telescope neoclip<CR>", "Clipboard list" }
lvim.builtin.which_key.mappings['gf'] = { "<cmd>DiffviewFileHistory %<CR>", "Git diff current file" }
lvim.builtin.which_key.mappings['gd'] = { "<cmd>DiffviewOpen<CR>", "Git Diff" }
lvim.builtin.which_key.mappings['gv'] = { "<cmd>Gitsigns toggle_linehl<CR>", "Git Diff" }

-- -- Change theme settings
-- lvim.colorscheme = "tokyonight-day"
lvim.colorscheme = "tokyonight-moon"

-- local h = tonumber(os.date("%H"))
-- if 7 <= h and h < 18 then lvim.colorscheme = "tokyonight-day"
-- else lvim.colorscheme = "tokyonight-moon"
-- end

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
-- lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.view.width = 40
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

lvim.builtin.telescope.theme = "ivy"
lvim.builtin.telescope.defaults.path_display = function(opts, path)
  local tail = require("telescope.utils").path_tail(path)
  return string.format("%s - %s", tail, path)
end

lvim.builtin.gitsigns.opts.signs.add.text = ""
lvim.builtin.gitsigns.opts.signs.delete.text = ""
lvim.builtin.gitsigns.opts.signs.change.text = ""

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.treesitter.textobjects.select = {
  enable = true,
  lookahead = true,
  keymaps = {
    ["af"] = "@function.outer",
    ["if"] = "@function.inner",
    ["ac"] = "@class.outer",
    ["ic"] = "@class.inner",
    ["al"] = "@loop.outer",
    ["il"] = "@loop.inner",
    ["a/"] = "@comment.outer",
    ["i/"] = "@comment.outer", -- no inner for comment
    ["aa"] = "@parameter.outer", -- parameter -> argument
    ["ia"] = "@parameter.inner",
  },
}

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex", "css", "scss", "html", "javascript",
  "typescript",
  "jsdoc", "json5", "tsx", "vue" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "emmet_ls" and server ~= "eslint"
end, lvim.lsp.automatic_configuration.skipped_servers)

require("lvim.lsp.manager").setup("emmet_ls", {
  filetypes = { "html", "javascriptreact", "typescriptreact", "css", "sass", "scss", "vue" }
})

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  },
}
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   {
--     command = "eslint_d",
--     filetypes = { "typescript", "typescriptreact", "vue" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  { "wakatime/vim-wakatime" },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "lilydjwg/fcitx.vim" },
  { "chentoast/marks.nvim",
    config = function()
      require("marks").setup {}
    end,
  },
  {
    "felipec/vim-sanegx",
    event = "BufRead",
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    -- module = "persistence",
    lazy = true,
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
      require("scrollbar.handlers.gitsigns").setup()
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript", "vue" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  { "m-demare/hlargs.nvim",
    config = true
  },
  { 'nvim-treesitter/nvim-treesitter-textobjects' },
  {
    "ggandor/leap.nvim",
    name = "leap",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
  },
  {
    "folke/zen-mode.nvim",
    config = true,
  },
  {
    "folke/twilight.nvim",
    config = true,
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end
  },
  { "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "kkharji/sqlite.lua" }
  },
  { "nvim-telescope/telescope-file-browser.nvim" },
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { 'kkharji/sqlite.lua', module = 'sqlite' },
    },
    config = true,
  },
  {
    "dhruvmanila/browser-bookmarks.nvim",
    version = "*",
    dependencies = {
      "tyru/open-browser.vim"
    }
  },
  { "nvim-telescope/telescope-media-files.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" }
}

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "frecency")
  pcall(telescope.load_extension, "file_browser")
  pcall(telescope.load_extension, "neoclip")
  pcall(telescope.load_extension, "bookmarks")
  pcall(telescope.load_extension, "media_files")
  pcall(telescope.load_extension, "ui-select")
end
lvim.builtin.telescope.extensions["bookmarks"] = {
  selected_browser = "chromium",
  url_open_plugin = "open_browser"
}
lvim.builtin.telescope.extensions["media_files"] = {
  filetypes = { "png", "jpg", "webp", "jpeg", "svg", "webm" }
}
lvim.builtin.telescope.extensions["ui-select"] = {
  require("telescope.themes").get_cursor {}
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
vim.api.nvim_create_autocmd("FileType", {
  pattern = "vue,javascript,typescript",
  callback = function()
    vim.cmd("setlocal spell")
  end,
})

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
